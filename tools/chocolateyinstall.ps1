
$ErrorActionPreference = 'Stop';
$checksum = "144a0110a9f58f9c33402c105a451c3b501e6267a2e9854c956b075f25f3373a"
$repository = "leezer3/OpenBve"
$software_name = "OpenBve"

Write-Host "Fetching version '$env:ChocolateyPackageVersion'"

$download_url = "https://github.com/$repository/releases/download/1.14.1.2/OpenBVE-1.14.1.2.zip"
$toolsDir = "$env:ProgramFiles\$software_name"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $download_url
  softwareName   = $software_name
  checksum       = $checksum
  checksumType   = 'sha256'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
}

$exe_path_64 = "$toolsDir\$software_name.exe"
$exe_path_32 = "$toolsDir\$software_name-32.exe"
Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyPath -PathToInstall $toolsDir -PathType "User"

Install-ChocolateyShortcut -ShortcutFilePath "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\OpenBve (x64).lnk" -TargetPath "$exe_path_64" -IconLocation $toolsDir\Data\icon.ico
Install-ChocolateyShortcut -ShortcutFilePath "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\OpenBve (x86).lnk" -TargetPath "$exe_path_32" -IconLocation $toolsDir\Data\icon.ico

Update-SessionEnvironment
