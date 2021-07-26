#!/bin/bash

fstabCheck=$(cat /etc/fstab | grep -v '#' | grep -i cifs | wc -l)
diskCheck=$(df -hT | grep -i cifs | wc -l)

if [ $fstabCheck == $diskCheck ]
then
  echo "`date` Cifs Check Started.."
  echo "`date` All CIFS Mounts are correctly Mounted." >> /tmp/cifs_mount.txt
else
  echo "`date` Cifs Check Started.."
  echo "`date` Need to check CIFS Mounts!" >> /tmp/cifs_not_mount.txt
  mount -a
fi

