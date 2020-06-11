#!/bin/bash

set -ex

sdir=$HOME/src
file=/lib/modules/$(uname -r)/kernel/net/igb_uio/igb_uio.ko
if [ ! -f "$file" ]; then
    pushd $sdir
      make
    popd
    d_dir=/lib/modules/$(uname -r)/kernel/net/igb_uio
    mkdir -p $d_dir
    cp -f $sdir/igb_uio.ko $d_dir/

    depmod -a
fi
