#Requires -Version 5.1
<#
  Temporarily switch the installed mod off/on, for before/after recordings.
  Only moves this mod's files; other mods in mediapc are not touched.

    .\tools\toggle-mod.ps1 off     # move mod files to mediapc_FH6UltrawideFix_off
    .\tools\toggle-mod.ps1 on      # move them back
    .\tools\toggle-mod.ps1 status

  -GamePath defaults to the author's install; pass your own if different.
#>
param(
    [Parameter(Mandatory = $true)][ValidateSet('on', 'off', 'status')][string]$Mode,
    [string]$GamePath = 'G:\SteamLibrary\steamapps\common\ForzaHorizon6'
)
$ErrorActionPreference = 'Stop'

$live = Join-Path $GamePath 'mediapc'
$off  = Join-Path $GamePath 'mediapc_FH6UltrawideFix_off'
$ui   = 'UI\Scenes\Anthem'
$xaml = @('A_DestinationMenu.xaml', 'A_InitialDriveSeasonTransitionFMV.xaml', 'A_MotionGraphics.xaml',
          'A_PostRaceFinishLine.xaml', 'A_Splash.xaml', 'A_VideoPlayer.xaml', 'Loading.xaml')

function Show-Status {
    $onCin  = Test-Path (Join-Path $live 'Cinematics')
    $offCin = Test-Path (Join-Path $off 'Cinematics')
    $onUi   = @($xaml | Where-Object { Test-Path (Join-Path $live "$ui\$_") }).Count
    $offUi  = @($xaml | Where-Object { Test-Path (Join-Path $off "$ui\$_") }).Count
    Write-Output "mediapc (active)  : Cinematics=$onCin  UI files=$onUi/7"
    Write-Output "disabled folder   : Cinematics=$offCin  UI files=$offUi/7"
}

if ($Mode -eq 'status') { Show-Status; exit 0 }

if (@(Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.ProcessName -match 'forza' }).Count -gt 0) {
    Write-Output 'Game is running - close it first.'; exit 1
}

if ($Mode -eq 'off') { $from = $live; $to = $off } else { $from = $off; $to = $live }

$src = Join-Path $from 'Cinematics'
if (Test-Path $src) {
    if (Test-Path (Join-Path $to 'Cinematics')) { throw "Target already has a Cinematics folder: $to" }
    New-Item -ItemType Directory -Force $to | Out-Null
    Move-Item $src (Join-Path $to 'Cinematics')
}
New-Item -ItemType Directory -Force (Join-Path $to $ui) | Out-Null
foreach ($x in $xaml) {
    $s = Join-Path $from "$ui\$x"
    if (Test-Path $s) { Move-Item $s (Join-Path $to "$ui\$x") -Force }
}

Write-Output "Mod is now $($Mode.ToUpper())."
Show-Status
