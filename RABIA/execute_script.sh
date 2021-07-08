#-sh-4.2$ cat execute_script.sh
#!/bin/sh

. ./ibm_pass

if [ -f "$1" ];then
for i in `grep -v '#' $1`
do
echo "Running script on $i"
sshpass -e ssh -o StrictHostKeyChecking=no ${SSHUSER}@$i "chmod 500 /tmp/iam_extract_global.sh && /tmp/iam_extract_global.sh > /tmp/current_working_directory-$(date +%Y%m%d_%H%M%S).log 2>&1 &" 2>/dev/null
done

fi

# Clear Password var
export SSHPASS=''