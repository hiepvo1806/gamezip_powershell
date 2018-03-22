# Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Add-Type -Assembly System.IO.Compression.FileSystem
$folderName = "testfold"
Write-Output  ("your folder is : " + $folderName)

$currentDate = Get-Date
Write-Output $currentDate.ToString("dd-MMM-yyyy-HH-mm-ss")
$dateString = $currentDate.ToString("dd-MMM-yyyy-HH-mm-ss")
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
Write-Output $directorypath
$sourcedir = $directorypath + "\"
$zipsource = $sourcedir + $folderName
$zipfilename = $sourcedir + $folderName + "_" + $dateString + ".zip"
Compress-Archive -Path $zipsource -DestinationPath $zipfilename