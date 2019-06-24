#!/usr/bin/env sh

MIRROR=https://dl.minio.io

SERVER_TS=2019-06-19T18-24-42Z
CLIENT_TS=2019-06-19T22-39-53Z

dl()
{
    APPDOM=$1
    APPNAME=$2
    PLATFORM=$3
    TS=$4
    FILE=$APPNAME.RELEASE.$TS.sha256sum
    URL=$MIRROR/$APPDOM/$APPNAME/release/$PLATFORM/$FILE
    printf "  # `echo $URL`\n"
    printf "  $PLATFORM: sha256:%s\n" `curl -sSL $URL | awk '{print $1}'`
}


printf "'$SERVER_TS':\n"
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl server minio $platform $SERVER_TS
done

printf "'$CLIENT_TS':\n"
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl client mc $platform $CLIENT_TS
done


