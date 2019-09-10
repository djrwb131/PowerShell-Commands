#Arguments are passed using $args array

<#
------------------
Arguments are passed using $args array.
------------------
There is also a param() function which can better define arguments:
Param(
    [Parameter()] <- attributes of parameter (see below)
    [String[]] <- type of parameter (array of strings in this case)
    $ComputerName <- name in script scope
)
For more information on parameter attributes:
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-6

------------------
Here's what a switch looks like in PS:
Switch (<test-value>)
{
    <condition> {<action>}
    <condition> {<action>}
}
------------------
#>
switch ($args[1]) {
    "-list" {
        foreach ($EventLogName in (get-childitem HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\)) {
            echo $Name.pschildname;
            }
    }