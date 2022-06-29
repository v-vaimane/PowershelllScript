
#$ResourceGroupName = 'RG_290622_02'
#$JobName ='RG_290622_02e2wg2ymkm6oiu'
#SubscriptionId = '995f2d66-72ff-4037-92c3-1a72fddac360'
#param([string]$SubscriptionId, [string]$Template="995f2d66-72ff-4037-92c3-1a72fddac360")

param([string]$SubscriptionId)
param([string]$ResourceGroupName)
param([string]$JobName)


Get-AzStreamAnalyticsJob -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -Name $JobName | Start-AzStreamAnalyticsJob




#Get-AzStreamAnalyticsJob -SubscriptionId '995f2d66-72ff-4037-92c3-1a72fddac360' -ResourceGroupName 'RG_290622_02' -Name 'RG_290622_02e2wg2ymkm6oiu' | Start-AzStreamAnalyticsJob


