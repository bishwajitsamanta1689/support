#!/bin/bash

echo "`date` Cifs Check Started.."

fstabCheck=$(cat /etc/fstab | grep -v '#' | grep -i cifs | wc -l)
diskCheck=$(df -hT | grep -i cifs | wc -l)

if [ $fstabCheck == $diskCheck ]
then
  echo "`date` All CIFS Mounts are correctly Mounted."
else
  echo "`date` Need to check CIFS Mounts!"
fi

