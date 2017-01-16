#!/bin/bash
# Get Nordic files, because their SDK license is not permissive.

SDK_VERSION="12.2.0"
SDK_CHECKSUM="f012efa"
SDK_URL="https://www.nordicsemi.com/eng/nordic/download_resource/54291/51/16000157"
SDK_FILE="nRF52_SDK_${SDK_VERSION}_${SDK_CHECKSUM}.zip"

WORKING_DIR=".sdk"

mkdir -p $WORKING_DIR

if [ -f $WORKING_DIR/$SDK_FILE ] 
then
	echo "SDK found"
else
	echo "Downloading SDK"
	curl -o $WORKING_DIR/$SDK_FILE $SDK_URL
fi

echo "Extracting SDK"
unzip -o -d $WORKING_DIR -q $WORKING_DIR/$SDK_FILE 

echo "Merging into project"
cp -rf $WORKING_DIR/components lib/
cp -rf $WORKING_DIR/documentation lib/

echo "Bootstrapping complete"
