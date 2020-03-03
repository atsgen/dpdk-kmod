#!/bin/bash

set -ex

dir=$(dirname $0)
source $dir/function

sdir=$dir/../src
version=0.1-dev

if is_ubuntu; then
  templ=$(cat $sdir/dkms.conf.tmpl)
  content=$(eval "echo \"$templ\"")
  echo "$content" > $sdir/dkms.conf
  cp -r $sdir /usr/src/igb_uio-${version}
  apt-get update
  apt-get install -y make gcc dkms
  dkms --verbose add -m igb_uio -v "${version}"
  dkms --verbose build -m igb_uio -v "${version}"
  dkms --verbose install -m igb_uio -v "${version}"
else
  if is_centos; then
    yum install -y gcc make
    pushd $sdir
      make
    popd
    d_dir=/lib/modules/`uname -r`/kernel/net/igb_uio
    mkdir -p $d_dir
    cp -f $sdir/igb_uio.ko $d_dir/
  else
    echo "UnSupported OS..."
    exit 1
  fi
fi

depmod -a
