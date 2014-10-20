#!/bin/bash
# curl-ftp-script
# Author: Ajay Gandhi
# Version: 0.1
# This script is open-source and provided as-is.
# http://github.com/ajay-gandhi/curl-ftp-script

# Username and password credentials
USERNAME="awesomesauce"
PASSWORD="mysecretpassword"

# This is the ftp server, i.e. ftp.example.com
# The script appends the protocol (ftp://) for you
SERVER="ftp.example.com"

# The default directory to upload files to
# This must begin with a forward slash, `/`,
# and end without a forward slash, else be
# empty for the home directory
DEFAULTDIR="/default/path"

if [[ $1 == /* ]]
then
  # First arg is which dir to upload to
  # Store first arg then remove it
  DIR=$1
  shift
  for i do
    echo "Uploading $i to $DIR"
    curl -k --ftp-ssl -u "$USERNAME":"$PASSWORD" ftp://"$SERVER$DEFAULTDIR$DIR"/ -T "$i"
    echo ""
  done
else
  # Just upload every arg as a separate file
  for i do
    echo "Uploading $i"
    curl -k --ftp-ssl -u "$USERNAME":"$PASSWORD" ftp://"$SERVER$DEFAULTDIR"/ -T "$i"
    echo ""
  done
fi
