#!/bin/bash

PROFILE_TRUTH="my-job-profile" # Insert the correct profile to list all buckets 
PROFILE_FAKE="my-personal-profile"  # Insert other profile name to verify if he have write permission

aws_path="/usr/local/bin/aws"
s3_output_list="/tmp/bucket_list.lst"
poc_file="/tmp/poc.txt"
result="/tmp/stdout.lst"
now=$(date)

if [ -f $aws_path ]
then 
    list_buckets=$(aws --profile $PROFILE_TRUTH s3 ls | cut -d " " -f3 > $s3_output_list)
    
    while IFS= read -r line
    do 
        echo "Proof of Concept - Access not authorized [bucket = $line] - [$now]"  > /tmp/poc.txt
        echo "Testing Bucket [$line]"
        aws s3 --profile $PROFILE_FAKE cp $poc_file s3://$line/poc.txt 1>> $result
        echo "-----------------------------------------------------------------------------------------"
    done < "$s3_output_list"
    
    output=$(cat $result | cut -d " " -f13)
    echo "----------------------------------- Vulnerable Buckets -----------------------------------"
    echo -e "$output\n"
    echo "----------------------------------- Vulnerable Buckets -----------------------------------"

    rm $result
    rm $s3_output_list
    rm $poc_file
else 
    echo -e 'Install AWSCLI and configure a profile.\nTutorial: https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-install.html'
fi