
param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName)

$ResourceGroupName = 'RG_300622_01'
$JobName ='RG_300622_016m7y6ooiyvrey'
$SubscriptionId = '995f2d66-72ff-4037-92c3-1a72fddac360'
$User = 'william@PSA365.onmicrosoft.com'
$PWord = ConvertTo-SecureString -String "Fpsteam1" -AsPlainText -Force
$Credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User,$PWord
$TenantId = 'f782ab25-637c-4888-b38e-79c78d14bb50'

Connect-AzAccount -Credential $Credential -Tenant $TenantId -Subscription $SubscriptionId

Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName  | Start-AzStreamAnalyticsJob







