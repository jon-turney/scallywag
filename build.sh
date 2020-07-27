#!/bin/sh

# SCRIPT names the build script to invoke
SCRIPT=$1
NOTEST=$2

# installed packages may have added files to /etc/profile.d/, so re-read profile
source /etc/profile
# restore cwd after /etc/profile sets it to $HOME
cd - >/dev/null

# prep/compile/install/package (as test)
cygport ${SCRIPT} all-test || exit 1

# run the package's test suite
if [ -z "$NOTEST" ]
then
   cygport ${SCRIPT} test || exit 1
fi
