
param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName)

$context = Set-AzContext -Subscription $SubscriptionId

Connect-AzAccount -Subscription $SubscriptionId

Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName | Start-AzStreamAnalyticsJob






