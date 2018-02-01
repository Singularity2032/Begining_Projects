#Get security logs and export to csv
#sm0k3

#Get user input for a detailed query
$computer_list = Read-Host -Prompt 'Input the computer list CSV file name'
$eventlog_query = Read_Host -Prompt 'Input the Event Log CSV name '

function Show-Menu
{
    param(
        [string]$Title = 'Event Log Query and System Inventory'
    )
    cls 
    Write-Host "-=-=-=-=-=-=-=-=-=-=$Title-=-=-=-=-=-=-=-=-=-="
    
    Write-Host "1:Press '1' to query the AD and export an CSV of computers in the domain"
    Write-Host "2:Press '2' to now query the domain csv and get event logs."
    Write-Host "3.Press '3' to eventually have some more functionality."
}
do 
{
    Show-Menu
    $input=Read_Host"Lets start the query"
    switch($input)
    {
        '1'{
            cls
            Write-Host "We will now query the DC for all PCs on the domain. Yes, this includes servers too."
            Get-ADComputer -Filter * -Property * | Format-Table Name, OperatingSystem, OperatingSystemServicePack, OperatingSystemVersion -wrap -Auto | Export-CSV $computer_list.csv -NoTypeInformation -Encoding UTF8
        }

    }

Get-ADComputer -Filter * -Property * | Format-Table Name, OperatingSystem, OperatingSystemServicePack, OperatingSystemVersion -Auto


get-wmiobject -query "Select * from Win32_NTLogEvent Where Logfile = 'Security'"
}