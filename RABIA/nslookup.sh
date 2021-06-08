#!/bin/bash

for vm in $(cat servers.txt)
do
   nslookup $vm | grep Name
done