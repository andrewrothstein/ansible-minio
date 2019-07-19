#!/usr/bin/env sh

MIRROR=https://dl.minio.io

SERVER_TS=2019-07-17T22-54-12Z
CLIENT_TS=2019-07-17T22-13-42Z

dl()
{
    APPDOM=$1
    APPNAME=$2
    PLATFORM=$3
    TS=$4
    FILE=$APPNAME.RELEASE.$TS.sha256sum
    URL=$MIRROR/$APPDOM/$APPNAME/release/$PLATFORM/$FILE
    printf "        # %s\n" $URL
    printf "        %s: sha256:%s\n" $PLATFORM `curl -sSL $URL | awk '{print $1}'`
}


printf "      '$SERVER_TS':\n"
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl server minio $platform $SERVER_TS
done

printf "    '$CLIENT_TS':\n"
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl client mc $platform $CLIENT_TS
done


