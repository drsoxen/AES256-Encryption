#!/bin/bash

if [ -z "$1" ]
then
	echo 'You must supply a encrypted file name'
	exit 1
fi

if [ -z "$2" ]
then
	echo 'You must supply an encryption key'
	exit 1
fi

openssl enc -in "$1".encrypted -out "$1".tar -d -aes256 -k "$2" && tar -xf "$1".tar && rm "$1".tar && rm "$1".encrypted


#https://codingbee.net/centos/openssl-demo-encrypting-decrypting-files-using-both-symmetric-and-asymmetric-encryption
