#!/bin/bash

source="$1"
output="$2"
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Check source exists
if [ -z "$source" ];then
	echo "No file selected"
	exit 0;
fi

# Set source as full path
userlocation=$(pwd)
if [[ "$source" != *\/* ]] && [[ "$source" != *\\* ]]
then
	source="$userlocation/$source"
fi

# Check source location exists
if [ ! -f "$source" ]; then
        echo "file source not found"
        exit 0;
fi

# Set output location if not set
if [ -z "$output" ];then
	output="${source::-4}_obfs.sql"
fi

cat "$source" | strike obfuscate --profile="$DIR"/tables_definition.rb > "$output"

echo "Success: File now placed in: $output"
