#!/bin/bash
# Get Nordic files, because their SDK license is not permissive.

SDK_VERSION="0.9.1"
SDK_CHECKSUM="3639cc9"
SDK_BASE="https://developer.nordicsemi.com/nRF52_SDK/nRF52_SDK_v0.x.x"
SDK_FILE="nRF52_SDK_${SDK_VERSION}_${SDK_CHECKSUM}.zip"

SDK_URL="$SDK_BASE/$SDK_FILE"

WORKING_DIR=".sdk"

mkdir $WORKING_DIR

if [ -f $WORKING_DIR/$SDK_FILE ] 
then
	echo "SDK found"
else
	echo "Downloading SDK"
	wget -P $WORKING_DIR $SDK_URL
fi

echo "Extracting SDK"
unzip -d $WORKING_DIR -q $WORKING_DIR/$SDK_FILE 

echo "Merging into project"
cp -rf $WORKING_DIR/components/* lib/components/

echo "Bootstrapping complete"