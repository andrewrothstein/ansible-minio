#!/usr/bin/env sh

MIRROR=https://dl.minio.io

# https://dl.minio.io/server/minio/release/linux-amd64/
SERVER_TS=2019-08-29T00-25-01Z

# https://dl.minio.io/client/mc/release/linux-amd64
CLIENT_TS=2019-08-29T00-40-57Z

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


printf "      '%s':\n" $SERVER_TS
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl server minio $platform $SERVER_TS
done

printf "      '%s':\n" $CLIENT_TS
for platform in darwin-amd64 linux-amd64 windows-amd64
do
    dl client mc $platform $CLIENT_TS
done


