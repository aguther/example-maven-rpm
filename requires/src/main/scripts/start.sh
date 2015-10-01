#!/bin/bash
# this scripts starts the example application

# determine directoy where script is stored
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIRECTORY="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# change to directoy of script
pushd $SCRIPT_DIRECTORY 1>/dev/null 2>&1

# go up one level (this is our application root)
cd ..

# start the application
java com.test.rpm_test.App

# restore directory
popd 1>/dev/null 2>&1
