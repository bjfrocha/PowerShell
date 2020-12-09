#!/snap/bin/powershell

# Syntax:       ./test.ps1
# Description:	simple PowerShell test script
# Author:	Markus Fleschutz
# Source:	github.com/fleschutz/PowerShell
# License:	CC0
 
try {
	write-output "✔️ PowerShell works. Details are:"
	echo $PSVersionTable
	exit 0
} catch {
	Write-Error "ERROR in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
