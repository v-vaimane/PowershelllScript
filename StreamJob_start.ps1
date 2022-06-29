
param([string]$SubscriptionId ,[string]$ResourceGroupName,[string]$JobName)

Connect-AzAccount -SubscriptionId $SubscriptionId
Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName | Start-AzStreamAnalyticsJob




#Get-AzStreamAnalyticsJob -SubscriptionId '995f2d66-72ff-4037-92c3-1a72fddac360' -ResourceGroupName 'RG_290622_02' -Name 'RG_290622_02e2wg2ymkm6oiu' | Start-AzStreamAnalyticsJob


