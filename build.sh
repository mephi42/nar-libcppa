#!/bin/sh

SCRIPT=$(readlink -f $0)
BASEDIR=$(dirname $SCRIPT)
TARGZ=$BASEDIR/gnu.tar.gz
GNUDIR=$BASEDIR/src/gnu

rm -rf $BASEDIR/src

cd $BASEDIR/libcppa
git ls-files | tar -czf $TARGZ -T -

mkdir -p $GNUDIR
cd $GNUDIR
tar -xzf $TARGZ
autoreconf -i

cd $BASEDIR
NO_VERSIONED_INCLUDE_DIR=1 mvn -X clean install
