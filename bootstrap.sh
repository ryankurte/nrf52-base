#!/bin/bash
# Get Nordic files, because their SDK license is not permissive.

SDK_VERSION="11.0.0"
SDK_CHECKSUM="89a8197"
SDK_URL="https://www.nordicsemi.com/eng/nordic/download_resource/54291/47/89561951"
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

echo "Bootstrapping complete"
