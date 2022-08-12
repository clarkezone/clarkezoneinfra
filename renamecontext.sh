#!/bin/bash
while getopts ":i:u:c:t:" option; do
    case $option in
        i) file=$OPTARG;;
        c) export clustername=$OPTARG;;
        u) export clusteruser=$OPTARG;;
        t) export contextname=$OPTARG;;
	\?) 
	   echo "renamecontext -i <file> -c <clustername> -u <clusteruser> -n <contextname>"
	   exit;;
    esac
done
if [ -z "$clustername"  ]
then
echo "missing clustername"
exit
fi

#export clustername="monitoringcluster-do"

# export clustername="monitoringcluster-do"
# export clusteruser="monitoringclusteruser"
# export contextname="monitoringclusterctx"
yq e -i '.clusters[0].name=env(clustername)' "$file"
yq e -i '.users[0].name=env(clusteruser)' "$file"
yq e -i '.contexts[0].context.cluster=env(clustername)' "$file"
yq e -i '.contexts[0].context.user=env(clusteruser)' "$file"
yq e -i '.contexts[0].name=env(contextname)' "$file"
yq e -i '.current-context=env(contextname)' "$file"
