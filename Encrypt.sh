#!/bin/bash

if [ -z "$1" ]
then
	echo 'You must supply a directory name'
	exit 1
fi

if [ -z "$2" ]
then
	openssl rand 256 > "$1"-Decryption.key
	tar -cf "$1".tar "$1"/ && openssl enc -in "$1".tar -out "$1".encrypted -e -aes256 -k "$1"-Decryption.key && rm "$1".tar && rm -rf "$1"/ 
else
	tar -cf "$1".tar "$1"/ && openssl enc -in "$1".tar -out "$1".encrypted -e -aes256 -k "$1" && rm "$1".tar && rm -r "$1"/
fi

#https://codingbee.net/centos/openssl-demo-encrypting-decrypting-files-using-both-symmetric-and-asymmetric-encryption
