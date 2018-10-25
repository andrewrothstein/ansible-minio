#!/usr/bin/env sh
VER=v3.3.10
DIR=~/Downloads

MIRROR=https://dl.minio.io


FILE_PREFIX=etcd-$VER

dl()
{
    APPDOM=$1
    APPNAME=$2
    PLATFORM=$3
    TS=$4
    FILE=$APPNAME.RELEASE.$TS.sha256sum
    URL=$MIRROR/$APPDOM/$APPNAME/release/$PLATFORM/$FILE
    echo $URL
    curl -L $URL
}

SERVER_TS=2018-10-25T01-27-03Z
CLIENT_TS=2018-10-18T00-40-05Z

for platform in linux-amd64
do
    dl server minio linux-amd64 $SERVER_TS
    dl client mc linux-amd64 $CLIENT_TS
done


