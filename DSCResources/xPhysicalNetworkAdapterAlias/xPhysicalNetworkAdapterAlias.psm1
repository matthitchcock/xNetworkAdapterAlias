function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $MacAddress
    )

    Import-Module xNetworkAdapterAlias

    $Adapter = xNetworkAdapterAlias\Get-xNetworkAdapterAlias -MacAddress $MacAddress

    if ($Adapter)
    {
        [String]$CurrentName = $Adapter.AliasName
    }

    $Output = @{
    MacAddress = $MacAddress
    AliasName = $CurrentName
    }

    return $Output

}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $MacAddress,

        [System.String]
        $AliasName
    )

    Import-Module xNetworkAdapterAlias

    xNetworkAdapterAlias\Set-xNetworkAdapterAlias -MacAddress $MacAddress -AliasName $AliasName 
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $MacAddress,

        [System.String]
        $AliasName
    )

    Import-Module xNetworkAdapterAlias

    [Boolean]$Result = xNetworkAdapterAlias\Test-xNetworkAdapterAlias -MacAddress $MacAddress -AliasName $AliasName

    return $Result
}


