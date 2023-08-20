#! /bin/sh
if [ $# -ne 1 ] 
then
  echo "Usage: $0 <filename>"
  exit 1
fi

file="$1"
if [ ! -e "${file}" ]
then
  echo File "${file}" does not exist
  exit 1
fi

suffix=0
baseBackupName="${file}.backup.$(date +%d-%m-%y)"
currBackupName="${baseBackupName}.${suffix}"
while [ -e "${currBackupName}" ]
do
  suffix=$((suffix + 1)) 
  currBackupName="${baseBackupName}.${suffix}"
done
if ! cp -r "${file}" "${currBackupName}"
then
  exit 1
fi

