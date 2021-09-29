Function Get-Something
{
<#
	.SYNOPSIS

	.DESCRIPTION

	.EXAMPLE

	.PARAMETER Path
		The Computer name to query. Just one.

	.INPUTS

	.OUTPUTS

	.NOTES
		Version:			0.1
		Author:				Lars Panzerbj�rn
		Creation Date:		2021.09.28
#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
			ValueFromPipeline=$True,
			ValueFromPipelineByPropertyName=$True,
			HelpMessage='What Computer name would you like to target?')]
		[Alias('host')]
		[ValidateLength(3,30)]
		[string[]]$ComputerName,

		[string]$LogName='Errors.txt'
	)

	BEGIN
	{
		Write-Verbose "Beginning $($MyInvocation.Mycommand)"
		Write-Verbose "Deleting $LogName"
		Remove-Item $LogName -ErrorActionSilentlyContinue
	}

	PROCESS
	{
		Write-Verbose "Processing $($MyInvocation.Mycommand)"

		ForEach ($Computer in $ComputerName) {
			Write-Verbose "Processing $Computer"
			# use $Computer to target a single Computer

			# create a hashtable with your output info
			$Info = @{
				'info1'=$value1;
				'info2'=$value2;
				'info3'=$value3;
				'info4'=$value4
			}
			Write-Output (New-Object -Typename PSObject -Property $Info)
		}
	}
	END
	{
		Write-Verbose "Ending $($MyInvocation.Mycommand)"
	}
}
