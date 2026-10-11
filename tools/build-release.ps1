#Requires -Version 5.1
<#
  Builds the release zip from mod\ and regenerates mediapc\FH6-Ultrawide-Fix-files.txt.

    .\tools\build-release.ps1                  # current release, v1.0
    .\tools\build-release.ps1 -Version x.y     # a different version

  Output: dist\FH6-Ultrawide-Fix-v<Version>.zip
  The zip root has README.md (same text as the repo README, images removed)
  and the "mediapc" folder, so players can drop that folder into the game.
#>
param([string]$Version = '1.0')
$ErrorActionPreference = 'Stop'

$root = Split-Path $PSScriptRoot -Parent
$mod  = Join-Path $root 'mod'
$dist = Join-Path $root 'dist'

$listName = 'FH6-Ultrawide-Fix-files.txt'
$listRel  = "mediapc\$listName"
$files = @(Get-ChildItem (Join-Path $mod 'mediapc') -Recurse -File |
    Where-Object { $_.Name -ne $listName } |
    Sort-Object FullName)
if ($files.Count -eq 0) { throw "No files under $mod\mediapc" }

$bad = @()
foreach ($f in $files) {
    if ($f.Extension -ne '.xml' -and $f.Extension -ne '.xaml') { continue }
    try { [xml](Get-Content $f.FullName -Raw -Encoding UTF8) | Out-Null } catch { $bad += $f.FullName }
}
# Two cinematics files are malformed in the original game data too; only fail on new problems.
$knownBad = @('pgc3116_prerace_countdown_alt_01.xml', 'pgc3117_prerace_countdown_alt_02.xml')
$unexpected = @($bad | Where-Object { $knownBad -notcontains (Split-Path $_ -Leaf) })
if ($unexpected.Count -gt 0) { throw "Malformed XML:`n" + ($unexpected -join "`n") }

$rel = @($listRel) + @($files | ForEach-Object { $_.FullName.Substring($mod.Length + 1) })
$cin = @($rel | Where-Object { $_ -like 'mediapc\Cinematics\*' })
$ui  = @($rel | Where-Object { $_ -like 'mediapc\UI\*' })

# Char codes, so this script stays ASCII and Windows PowerShell 5.1 does not
# misread UTF-8 source as the system code page.
function U([int[]]$codes) { -join ($codes | ForEach-Object { [char]$_ }) }
$fileList = U 0x6587,0x4EF6,0x6E05,0x5355          # 文件清单
$publish  = U 0x53D1,0x5E03,0x548C,0x7EF4,0x62A4  # 发布和维护
$project  = U 0x9879,0x76EE                        # 项目
$title = if ($Version) { "FH6-Ultrawide-Fix v$Version" } else { "FH6-Ultrawide-Fix" }
$manifest = @(
    "$title - file list / $fileList"
    "$publish / Published and maintained on: https://github.com/zzzLiu/FH6-Ultrawide-Fix"
    "$project / Project: FH6-Ultrawide-Fix"
    "Total: $($rel.Count) files  (Cinematics: $($cin.Count), UI: $($ui.Count), list: 1)"
    ''
    '[List]'
    $listRel
    ''
    '[UI]'
) + $ui + @('', '[Cinematics]') + $cin
$utf8 = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllLines((Join-Path $mod $listRel), $manifest, $utf8)

# Zip README is the repo README with images removed, so the wording stays in step.
$readme = [IO.File]::ReadAllText((Join-Path $root 'README.md'), $utf8)
$plain = $readme
$plain = [regex]::Replace($plain, '<a\b[^>]*>\s*<img\b[^>]*>\s*</a>', '')
$plain = [regex]::Replace($plain, '<img\b[^>]*>', '')
$plain = [regex]::Replace($plain, '!\[[^\]]*\]\([^)]*\)', '')
$plain = [regex]::Replace($plain, '(\r?\n)[ \t]*(\r?\n){2,}', "`n`n")
$plain = $plain.TrimEnd() + "`n"
$plainReadme = Join-Path $dist 'README.md'
$oldList = Join-Path $root 'FILES.txt'
if (Test-Path $oldList) { Remove-Item $oldList }

New-Item -ItemType Directory -Force $dist | Out-Null
[IO.File]::WriteAllText($plainReadme, $plain, $utf8)
$zipName = if ($Version) { "FH6-Ultrawide-Fix-v$Version.zip" } else { "FH6-Ultrawide-Fix.zip" }
$zip = Join-Path $dist $zipName
if (Test-Path $zip) { Remove-Item $zip }
$unversioned = Join-Path $dist 'FH6-Ultrawide-Fix.zip'
if ($Version -and (Test-Path $unversioned)) { Remove-Item $unversioned }
# Write entries with "/" separators; Compress-Archive on PS 5.1 writes "\" which some unzip tools mishandle.
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem
$archive = [IO.Compression.ZipFile]::Open($zip, 'Create')
try {
    [IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
        $archive, $plainReadme, 'README.md', 'Optimal') | Out-Null
    foreach ($r in $rel) {
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $archive, (Join-Path $mod $r), ($r -replace '\\', '/'), 'Optimal') | Out-Null
    }
} finally { $archive.Dispose() }

Write-Output "files : $($rel.Count)  (Cinematics $($cin.Count), UI $($ui.Count))"
Write-Output "zip   : $zip  ($([math]::Round((Get-Item $zip).Length / 1MB, 1)) MB)"
Write-Output "list  : $(Join-Path $mod $listRel)"
Write-Output "readme: $plainReadme"
