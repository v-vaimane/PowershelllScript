#copy file Git to local
Invoke-WebRequest -Uri https://raw.githubusercontent.com/v-vaimane/PowershelllScript/main/CRMHelperApiApp.zip -OutFile .\CRMHelperApiApp.zip;
Invoke-WebRequest -Uri https://github.com/v-vaimane/PowershelllScript/raw/main/IoTHubAPIApp.zip -OutFile .\IoTHubAPIApp.zip;
Invoke-WebRequest -Uri https://github.com/v-vaimane/PowershelllScript/blob/main/QueueMessageParserApiApp.zip?raw=true -OutFile .\QueueMessageParserApiApp.zip;
Invoke-WebRequest -Uri https://github.com/v-vaimane/PowershelllScript/blob/main/Simulator.zip?raw=true -OutFile .\Simulator.zip;

$Package1 = Get-ChildItem C:\Windows\System32 -Name CRMHelperApiApp.zip
$Package2 = Get-ChildItem C:\Windows\System32 -Name IoTHubAPIApp.zip
$Package3 = Get-ChildItem C:\Windows\System32 -Name QueueMessageParserApiApp.zip
$Package4 = Get-ChildItem C:\Windows\System32 -Name Simulator.zip

$PackagesArray = @($Package1 ,$Package2,$Package3,$Package4)

#Container name we will get this as a parameter from ARM template
$Container= "package" 

#storage account name We can pass this from ARM 
$storageAccountName = "storagemv5jw47uieo7i"

#Set storage account key #We can pass this from ARM 
$Key = "9jS0Q8ddO5qbr83uBGyMAi6phLmeqHGXyfD/mhXrbN2jODHb7n7+dPIUpJHBf2lIUI3xXBLXA2ga+ASttnaqkA=="

$properties = @{"ContentType" = "application/zip"}
#create a context for communicating with azure storage
$ctx = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $key -Protocol Https

#use Set-AzureStorageBlobContent to upload file
for($i=0; $i -lt $PackagesArray.Length; $i++)  
{
    Set-AzureStorageBlobContent -File $PackagesArray[$i] -Container $Container -Context $ctx -BlobType Block -Properties $properties
}