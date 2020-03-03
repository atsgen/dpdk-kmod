#!/bin/bash -e

while getopts ":i:" opt; do
    case $opt in
      i) IMAGE=$OPTARG
         ;;
      \?) echo "Invalid option: $opt"; exit 1;;
    esac
done

shift $((OPTIND-1))
TAG=${1:-latest}

for d in $(ls -d $(dirname $0)/*/);do
  IFS='/' read -ra txt <<< "$d"
  LINUX_DISTR=${txt[1]}

  IMAGE="atsgen/igb-uio-${LINUX_DISTR}"

  logfile="./build-igb-uio-${LINUX_DISTR}.log"
  echo Building igb-uio image: ${IMAGE}:${TAG} | tee $logfile

  build_opts="--build-arg LC_ALL=en_US.UTF-8 --build-arg LANG=en_US.UTF-8 --build-arg LANGUAGE=en_US.UTF-8"
  build_opts+=" --no-cache --tag ${IMAGE}:${TAG} -f Dockerfile ."


  pushd ${LINUX_DISTR}
  scp -r $(dirname $0)/../../src .
  sudo docker build $build_opts 2>&1 | tee -a ../$logfile
  rm -rf src
  popd

done
exit 0
