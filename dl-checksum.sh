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

SERVER_TS=2019-03-20T22-38-47Z
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl server minio $platform $SERVER_TS
done

CLIENT_TS=2019-03-20T21-29-03Z
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl client mc $platform $CLIENT_TS
done


