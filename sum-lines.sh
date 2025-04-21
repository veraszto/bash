#! /bin/bash

file=$1

lines=$(wc -l $1 | grep -o "[0-9]\+")

toSum=$(cat $1 | xargs)

plusSigns=""

for ((i=0; i<$lines ; i++)); do
	plusSigns="$plusSigns +"
done

echo "$toSum ${plusSigns:0:-1}"

echo "2 k $toSum ${plusSigns:0:-1} f" | dc
