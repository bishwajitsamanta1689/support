#!/bin/bash
rgName=1-9bc9d339-playground-sandbox
vmlist=$(az vm list -g $rgName --query "[].name" -o tsv)

for vm in  $vmlist
do

vmLocation=$(az vm show -g $rgName -n $vm --query "location" -o tsv)
echo $vm :: $vmLocation

vmImageDetails=$(	az vm show --resource-group $rgName --name $vm --query "storageProfile.imageReference.exactVersion" -otsv)
echo $vm :: $vmImageDetails
done