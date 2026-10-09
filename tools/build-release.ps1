#Requires -Version 5.1
<#
  Builds the release zip from mod\ and regenerates FILES.txt.

    .\tools\build-release.ps1 -Version 1.0.0

  Output: dist\FH6-Ultrawide-Fix-v<Version>.zip
  The zip root contains only the "mediapc" folder, so players can drop it
  straight into the game folder.
#>
param([string]$Version = '1.0.0')
$ErrorActionPreference = 'Stop'

$root = Split-Path $PSScriptRoot -Parent
$mod  = Join-Path $root 'mod'
$dist = Join-Path $root 'dist'

$files = @(Get-ChildItem (Join-Path $mod 'mediapc') -Recurse -File | Sort-Object FullName)
if ($files.Count -eq 0) { throw "No files under $mod\mediapc" }

$bad = @()
foreach ($f in $files) {
    try { [xml](Get-Content $f.FullName -Raw -Encoding UTF8) | Out-Null } catch { $bad += $f.FullName }
}
# Two cinematics files are malformed in the original game data too; only fail on new problems.
$knownBad = @('pgc3116_prerace_countdown_alt_01.xml', 'pgc3117_prerace_countdown_alt_02.xml')
$unexpected = @($bad | Where-Object { $knownBad -notcontains (Split-Path $_ -Leaf) })
if ($unexpected.Count -gt 0) { throw "Malformed XML:`n" + ($unexpected -join "`n") }

$rel = $files | ForEach-Object { $_.FullName.Substring($mod.Length + 1) }
$cin = @($rel | Where-Object { $_ -like 'mediapc\Cinematics\*' })
$ui  = @($rel | Where-Object { $_ -like 'mediapc\UI\*' })

$manifest = @(
    "FH6-Ultrawide-Fix v$Version - file list / 文件清单"
    "Total: $($rel.Count) files  (Cinematics: $($cin.Count), UI: $($ui.Count))"
    ''
    '[UI]'
) + $ui + @('', '[Cinematics]') + $cin
$utf8 = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllLines((Join-Path $root 'FILES.txt'), $manifest, $utf8)

New-Item -ItemType Directory -Force $dist | Out-Null
$zip = Join-Path $dist "FH6-Ultrawide-Fix-v$Version.zip"
if (Test-Path $zip) { Remove-Item $zip }
# Write entries with "/" separators; Compress-Archive on PS 5.1 writes "\" which some unzip tools mishandle.
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem
$archive = [IO.Compression.ZipFile]::Open($zip, 'Create')
try {
    foreach ($r in $rel) {
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $archive, (Join-Path $mod $r), ($r -replace '\\', '/'), 'Optimal') | Out-Null
    }
} finally { $archive.Dispose() }

Write-Output "files : $($rel.Count)  (Cinematics $($cin.Count), UI $($ui.Count))"
Write-Output "zip   : $zip  ($([math]::Round((Get-Item $zip).Length / 1MB, 1)) MB)"
Write-Output "list  : $(Join-Path $root 'FILES.txt')"
