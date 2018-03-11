# Login to your Azure subscription
Login-AzureRmAccount
# Is there an active Azure subscription?
$sub = Get-AzureRmSubscription -ErrorAction SilentlyContinue
if(-not($sub))
{
    Add-AzureRmAccount
}

# If you have multiple subscriptions, set the one to use
# $subscriptionID = "<subscription ID to use>"
# Select-AzureRmSubscription -SubscriptionId $subscriptionID

# Get user input/default values
$resourceGroupName = Read-Host -Prompt "Enter the resource group name"
$location = Read-Host -Prompt "Enter the Azure region to create resources in"

# Create the resource group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location

# Get iothub name
$iotHubName = Read-Host -Prompt "Enter the name of Iot Hub"

$skuName = "S1"
$units = 1

# Create IotHub
New-AzureRmIotHub `
    -Name $iotHubName `
    -Location $location `
    -ResourceGroupName $resourceGroupName `
    -SkuName $skuName `
    -Units $units
