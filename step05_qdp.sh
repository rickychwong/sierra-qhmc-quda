#! /bin/bash

echo ""
echo "#######"
echo "# QDP #"
echo "#######"

source env.sh

pushd $(pwd)

# Download, reconfigure
cd $BASEDIR/lqcd/src
git clone https://github.com/usqcd-software/qdp
mv qdp qdp-git
cd qdp-git
sed -i 's/doc //g' Makefile.am # doc complains b/c of no makeinfo
autoreconf

# Clean up build directory just in case
cd $BASEDIR/lqcd/build/qdp-git-omp/
rm -rf *


# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qdp git

popd
