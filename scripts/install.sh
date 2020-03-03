#!/bin/bash

set -ex

dir=$(dirname $0)
source $dir/function

sdir=$dir/../src
version=0.1-dev
templ=$(cat $sdir/dkms.conf.tmpl)
content=$(eval "echo \"$templ\"")
echo "$content" > $sdir/dkms.conf
cp -r $sdir /usr/src/igb_uio-${version}
dkms --verbose add -m igb_uio -v "${version}"
dkms --verbose build -m igb_uio -v "${version}"
dkms --verbose install -m igb_uio -v "${version}"
depmod -a

