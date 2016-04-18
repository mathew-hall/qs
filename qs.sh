#!/usr/bin/env bash
MYDIR="$(dirname $BASH_SOURCE)"
qstat -xml $@ | xsltproc "${MYDIR}/test.xslt" - 
