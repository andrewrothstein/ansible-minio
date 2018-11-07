#!/usr/bin/env sh
DIR=~/Downloads

MIRROR=https://dl.minio.io

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

SERVER_TS=2018-11-06T01-01-02Z
CLIENT_TS=2018-11-06T01-12-20Z

for platform in linux-amd64
do
    dl server minio linux-amd64 $SERVER_TS
    dl client mc linux-amd64 $CLIENT_TS
done


