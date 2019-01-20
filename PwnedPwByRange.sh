#!/bin/bash -x

# WARNING: Make sure you disable shell history before running this or your
#   passwords will be stored in your command line history.
#   For bash, run: 'set +o histo'

# $1 is the pw you want to check
if [ "$1" == "" ]; then
  echo $0 missing password to check
  exit 1
fi

# Uncomment one of the following SHA1PW below:
SHA1PW=`echo -n $1 | /usr/bin/sha1sum | cut -c 1-40`
# SHA1PW=`echo -n \"$1\" | /usr/bin/openssl sha1 | cut 10-30`
HashHead=`echo $SHA1PW | cut -c 1-5`
HashTail=`echo $SHA1PW | cut -c 6-`

TMPFILE=`mktemp`
curl https://api.pwnedpasswords.com/range/$HashHead > $TMPFILE
grep -i $HashTail $TMPFILE
