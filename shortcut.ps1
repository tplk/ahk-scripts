param (
	[Parameter(Mandatory=$true)][string]$target,
	[Parameter(Mandatory=$true)][string]$path
)

$objShell = New-Object -ComObject ("WScript.Shell")
$objShortCut = $objShell.CreateShortcut("$path")
$objShortCut.TargetPath = "$target"
$objShortCut.Save()

Write-Host "Created a shortcut:"
Write-Host $path
