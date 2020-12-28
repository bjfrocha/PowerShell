#!/snap/bin/powershell

# Syntax:       ./turn-volume-down.ps1
# Description:	turns the volume down
# Author:	Markus Fleschutz
# Source:	github.com/fleschutz/PowerShell
# License:	CC0

try {
	$obj = new-object -com wscript.shell
	for ($i = 0; $i -lt 5; $i++) {
		$obj.SendKeys([char]174) # each tick is -2%
	}
	write-output "OK"
	exit 0
} catch {
	write-error "ERROR in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
