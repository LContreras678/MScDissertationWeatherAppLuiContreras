$src = (Get-Item -LiteralPath ".").FullName
$dst = Join-Path $env:TEMP "cleanpush_lui_msc2"
Remove-Item -Recurse -Force $dst -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $dst | Out-Null
robocopy $src $dst /E /XD .git .vs obj bin publish WeatherWebAppLuiC\publish > $null
Set-Location $dst
git init
git add -A
git commit -m "main"
git remote add origin https://github.com/LContreras678/MScDissertationWeatherAppLuiContreras.git
git push --force origin master:main
Set-Location $src
Write-Host "Done."