#!/usr/bin/env sh

set -x

: ${TARGETPLATFORM=}
: ${TARGETARCH=}

: ${OUT_ARCH=}

case "$TARGETPLATFORM" in
"linux/amd64")
  OUT_ARCH="linux-x64"
  ;;
"linux/arm64")
  OUT_ARCH="linux-arm64"
  ;;
"linux/arm")
  OUT_ARCH="linux-arm"
  ;;
esac

echo Using ${OUT_ARCH} architecture for dotnet publish

dotnet publish -c Release -o out -r $OUT_ARCH --self-contained true -p:PublishSingleFile=true