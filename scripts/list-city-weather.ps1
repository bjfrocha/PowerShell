﻿<#
.SYNOPSIS
	Lists the weather of cities
.DESCRIPTION
	This PowerShell script lists the current weather conditions of cities world-wide (west to east).
.EXAMPLE
	PS> ./list-city-weather.ps1

	CITY                TEMP          RAIN            WIND         SUN
	----                ----          ----            ----         ---
	Hawaii ⛅️           +25°C         0.0mm 69%       ↙5km/h       06:49:15 → 17:47:57
	...
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

function List-City-Weather {
	$cities = @("Hawaii","Los Angeles","Mexico City","Dallas","Miami","New York","Rio de Janeiro","Paris","London","Berlin","Cape Town","Dubai","Mumbai","Singapore","Hong Kong","Perth","Peking","Tokyo","Sydney")
	foreach($city in $cities) {
		$icon = (Invoke-WebRequest http://wttr.in/${City}?format="%c" -UserAgent "curl" -useBasicParsing).Content
		$temp = (Invoke-WebRequest http://wttr.in/${City}?format="%t" -UserAgent "curl" -useBasicParsing).Content
		$rain = (Invoke-WebRequest http://wttr.in/${City}?format="%p %h" -UserAgent "curl" -useBasicParsing).Content
		$wind = (Invoke-WebRequest http://wttr.in/${City}?format="%w" -UserAgent "curl" -useBasicParsing).Content
		$sun = (Invoke-WebRequest http://wttr.in/${City}?format="%S → %s" -UserAgent "curl" -useBasicParsing).Content
		New-Object PSObject -Property @{ CITY="$city $icon"; TEMP=$temp; RAIN=$rain; WIND=$wind; SUN=$sun }
	}
}

try {
	List-City-Weather | Format-Table -property @{e='CITY';width=19},@{e='TEMP';width=9},@{e='RAIN';width=14},@{e='WIND';width=12},@{e='SUN';width=20}
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}