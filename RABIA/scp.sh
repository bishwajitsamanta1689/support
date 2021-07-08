#-sh-4.2$ cat scp_script.sh
#!/bin/sh

. ./ibm_pass

if [ -f "$1" ];then
for i in `grep -v '#' $1`
do
echo "Running script on $i"
sshpass -e scp -o StrictHostKeyChecking=no iam_extract_global.sh ${SSHUSER}@$i:/tmp
done

fi

# Clear Password var
export SSHPASS=''