param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName,[string]$TenantId)

$User = 'william@PSA365.onmicrosoft.com'
$PWord = ConvertTo-SecureString -String "Fpsteam1" -AsPlainText -Force
$Credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User,$PWord

Connect-AzAccount -Credential $Credential -Tenant $TenantId -SubscriptionId $SubscriptionId

Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName  | Start-AzStreamAnalyticsJob



