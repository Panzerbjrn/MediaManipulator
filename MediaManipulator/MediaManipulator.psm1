#region Script Header
#	Thought for the day: 
#	NAME: MediaManipulator.psm1
#	AUTHOR: Lars Panzerbjørn
#	CONTACT: Lars@Panzerbjrn.eu / GitHub: Panzerbjrn / Twitter: Panzerbjrn
#	DATE: 2021.09.28
#	VERSION: 0.1 - 2021.09.28 - Module Created with Create-NewModuleStructure by Lars Panzerbj�rn
#
#	SYNOPSIS:
#
#
#	DESCRIPTION:
#	MediaManipulator is a module that will help you manipulate your media files.
#
#	REQUIREMENTS:
#
#endregion Script Header

#Requires -Version 4.0

[CmdletBinding(PositionalBinding=$false)]
param()

Write-Verbose $PSScriptRoot

#Get Functions and Helpers function definition files.
$Functions	= @( Get-ChildItem -Path $PSScriptRoot\Functions\*.ps1 -ErrorAction SilentlyContinue )
$Helpers = @( Get-ChildItem -Path $PSScriptRoot\Helpers\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
ForEach ($Import in @($Functions + $Helpers))
{
	Try
	{
		. $Import.Fullname
	}
	Catch
	{
		Write-Error -Message "Failed to Import function $($Import.Fullname): $_"
	}
}

Export-ModuleMember -Function $Functions.Basename

