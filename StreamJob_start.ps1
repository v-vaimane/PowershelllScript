
param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName)


Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName | Start-AzStreamAnalyticsJob






