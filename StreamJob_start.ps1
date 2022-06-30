
param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName)

$context = Set-AzContext -Subscription $SubscriptionId

Connect-AzAccount -ContextName $context

Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName | Start-AzStreamAnalyticsJob






