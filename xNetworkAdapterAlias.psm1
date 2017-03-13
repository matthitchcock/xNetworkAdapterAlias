Function Get-xNetworkAdapterAlias
{
    [CmdletBinding()]
    Param(
        [String]$MacAddress,
        [String]$AliasName
    )

    [Array]$Adapter = (NetAdapter\Get-NetAdapter) | Where-Object {($psitem.Virtual -eq $false) -and ($PSItem.MacAddress -eq $MacAddress)}

    if ($Adapter.Count -eq 1)
    {

        $Output = @{
            MacAddress = $MacAddress
            AliasName = $Adapter.Name
        }

        Return $Output
    }
    else
    {
        Write-Error -Message "Could not identify correct NetAdapter"
    }
}

Function Set-xNetworkAdapterAlias
{
    [CmdletBinding()]
    Param(
        [String]$MacAddress,   
        [String]$AliasName
    )

    [Array]$Adapter = (NetAdapter\Get-NetAdapter) | Where-Object {($psitem.Virtual -eq $false) -and ($PSItem.MacAddress -eq $MacAddress)}

    if ($Adapter.Count -eq 1)
    {
        NetAdapter\Rename-NetAdapter -Name $Adapter[0].Name -NewName $AliasName
    }
    else
    {
        Write-Error -Message "Could not identify correct NetAdapter"
    }
}

Function Test-xNetworkAdapterAlias
{
    [CmdletBinding()]
    Param(
        [String]$MacAddress,
        [String]$AliasName
    )

    [Boolean]$Result = $false

    if ((NetAdapter\Get-NetAdapter | Where-Object {($psitem.Virtual -eq $false) -and ($psitem.MacAddress -eq $MacAddress)}).Name -eq $AliasName)
    {
        $Result = $true
    }

    Return $Result
}
