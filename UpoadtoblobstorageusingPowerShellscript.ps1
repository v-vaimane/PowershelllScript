Connect-AzAccount

#install below packages
#Install-Module Az -Force
#Import-Module Az

#Get file name 
$FileName = Get-ChildItem C:\UploadPackages -Filter *.zip 

#$name = (Get-Item $FileName).Name

#Container name we will get this as a parameter from ARM template
$Container= "package" 

#storage account name We can pass this from ARM 
$storageAccountName = "storagemv5jw47uieo7i"

#Set storage account key #We can pass this from ARM 
$Key = "9jS0Q8ddO5qbr83uBGyMAi6phLmeqHGXyfD/mhXrbN2jODHb7n7+dPIUpJHBf2lIUI3xXBLXA2ga+ASttnaqkA=="

#Set storage context
$context =New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $Key
                       
#Storage host name
$HTTPSStoragehost = $context.BlobEndPoint

#SAS Token Container
$SASTokenContainer = New-AzureStorageContainerSASToken -Name "package" -Context $context -Permission rwdl

#Set start & end time
$StartTime = Get-Date
$EndTime = $StartTime.AddHours(4.0)

#Required Header
$header=@{
        'x-ms-blob-type'='BlockBlob'
}

#REST API uri to upload the file to storage account is 
for($i=0; $i -lt $FileName.Length; $i++)   
{
    $URI = "$($HTTPSStoragehost)$($Container)/$($FileName[$i])$($SASTokenContainer)"
    #Upload file
    Invoke-RestMethod -Method PUT -Uri $URI -Headers $header -InFile $FileName[$i]
}
