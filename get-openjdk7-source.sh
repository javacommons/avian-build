#!/bin/sh
TS=`date "+%Y-%m%d-%H%M%S"`
rm -rf jdk7u
hg clone --verbose --pull http://hg.openjdk.java.net/jdk7u/jdk7u jdk7u
(cd jdk7u && sh -v ./get_source.sh)
tar cfz jdk7u-${TS}.tgz ./jdk7u
