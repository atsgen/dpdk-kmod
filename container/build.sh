#!/bin/bash -e

LINUX_DISTR=${LINUX_DISTR:-'ubuntu'}

while getopts ":i:" opt; do
    case $opt in
      i) IMAGE=$OPTARG
         ;;
      \?) echo "Invalid option: $opt"; exit 1;;
    esac
done

shift $((OPTIND-1))

IMAGE="${IMAGE:-atsgen/igb-uio-${LINUX_DISTR}}"
TAG=${1:-latest}

logfile="./build-igb_uio.log"
echo Building igb-uio image: ${IMAGE}:${TAG} | tee $logfile

build_opts="--build-arg LC_ALL=en_US.UTF-8 --build-arg LANG=en_US.UTF-8 --build-arg LANGUAGE=en_US.UTF-8"
build_opts+=" --no-cache --tag ${IMAGE}:${TAG} -f Dockerfile.${LINUX_DISTR} ."

scp -r $(dirname $0)/../src .

sudo docker build $build_opts 2>&1 | tee -a $logfile

rm -rf src
