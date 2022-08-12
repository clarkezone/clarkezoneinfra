#!/bin/bash
while getopts ":i:u:c:t:" option; do
    case $option in
        i) file=$OPTARG;;
        c) export clustername=$OPTARG;;
        u) export clusteruser=$OPTARG;;
        t) export contextname=$OPTARG;;
	\?) 
	   echo "renamecontext -i <file> -c <clustername> -u <clusteruser> -t <contextname>"
	   exit;;
    esac
done
if [ -z "$file"  ]
then
echo "missing file renamecontext -i <file> -c <clustername> -u <clusteruser> -t <contextname>"
exit
fi
if [ -z "$clustername"  ]
then
echo "missing clustername renamecontext -i <file> -c <clustername> -u <clusteruser> -t <contextname>"
exit
fi
if [ -z "$clusteruser"  ]
then
echo "missing cluster user renamecontext -i <file> -c <clustername> -u <clusteruser> -t <contextname>"
exit
fi
if [ -z "$contextname"  ]
then
echo "missing contextname renamecontext -i <file> -c <clustername> -u <clusteruser> -t <contextname>"
exit
fi

yq e -i '.clusters[0].name=env(clustername)' "$file"
yq e -i '.users[0].name=env(clusteruser)' "$file"
yq e -i '.contexts[0].context.cluster=env(clustername)' "$file"
yq e -i '.contexts[0].context.user=env(clusteruser)' "$file"
yq e -i '.contexts[0].name=env(contextname)' "$file"
yq e -i '.current-context=env(contextname)' "$file"
