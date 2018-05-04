#!/usr/bin/env bash

: ${DRAFT_PLUGIN_PATH:="$DRAFT_HOME/plugins/draft-hello"}

ARCH=$(uname -m)
case $ARCH in
    armv5*) ARCH="armv5";;
    armv6*) ARCH="armv6";;
    armv7*) ARCH="armv7";;
    aarch64) ARCH="arm64";;
    x86) ARCH="386";;
    x86_64) ARCH="amd64";;
    i686) ARCH="386";;
    i386) ARCH="386";;
esac

OS=$(echo `uname`|tr '[:upper:]' '[:lower:]')
case "$OS" in
    msys*) OS='windows';;
    mingw*) OS='windows';;
esac

DOWNLOAD_URL="https://github.com/ojiry/draft-hello/releases/download/v0.0.1/draft-hello_v0.0.1_${OS}_${ARCH}.zip"
PLUGIN_TMP_FILE="/tmp/draft-hello.tgz"
echo "Downloading $DOWNLOAD_URL"
if type "curl" > /dev/null; then
    curl -L "$DOWNLOAD_URL" -o "$PLUGIN_TMP_FILE"
elif type "wget" > /dev/null; then
    wget -q -O "$PLUGIN_TMP_FILE" "$DOWNLOAD_URL"
fi

DRAFT_TMP="/tmp/draft-hello"
mkdir -p "$DRAFT_TMP"
tar xf "$PLUGIN_TMP_FILE" -C "$DRAFT_TMP"
DRAFT_TMP_BIN="$DRAFT_TMP/draft-hello_v0.0.1_${OS}_${ARCH}/hello"
echo "Preparing to install into ${DRAFT_PLUGIN_PATH}"
mkdir -p "$DRAFT_PLUGIN_PATH/bin"
cp "$DRAFT_TMP_BIN"* "$DRAFT_PLUGIN_PATH/bin"
