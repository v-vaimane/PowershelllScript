
param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName)


$context = Set-AzContext -Subscription $SubscriptionId
$User = $context.Account.Id
$TenantId = $context.Tenant

$JobName ='RG_300622_02bskmkujmlarv2-PBI'

$User = 'william@PSA365.onmicrosoft.com'
$PWord = ConvertTo-SecureString -String "Fpsteam1" -AsPlainText -Force
$Credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User,$PWord

Connect-AzAccount -Credential $Credential -Tenant $TenantId -Subscription $SubscriptionId

Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName  | Start-AzStreamAnalyticsJob







