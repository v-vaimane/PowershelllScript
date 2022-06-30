
param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName)


Connect-AzAccount -Subscription $SubscriptionId

Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName | Start-AzStreamAnalyticsJob






