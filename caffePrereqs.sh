#!/bin/bash -i

module load gcc/4.4.7
module load cmake/3.2.2
packageDir=/global/home/users/shubhtuls/packages

## glog
#wget https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz
#tar zxvf glog-0.3.3.tar.gz
#cd glog-0.3.3
#./configure --prefix=/global/home/users/shubhtuls/local/
#make && make install
#cd packageDir

## gflags
#wget https://github.com/schuhschuh/gflags/archive/master.zip
#unzip master.zip
#cd gflags-master
#mkdir build && cd build
#export CXXFLAGS="-fPIC"
#cmake -DCMAKE_INSTALL_PREFIX=install ..
#make VERBOSE=1
#make && make install
#cp -r ./install/* /global/home/users/shubhtuls/local/
#cd packageDir

## protobuf
#git clone https://github.com/google/protobuf.git
#./configure --prefix=/global/home/users/shubhtuls/local/
#make -j 8
#make check
#make install
#cd packageDir

## lmdb
#git clone https://github.com/LMDB/lmdb
#cd lmdb/libraries/liblmdb
#sed -i 's/\/usr\/local/\/global\/home\/users\/shubhtuls\/localTmp/g' Makefile
#make && make install
#cd packageDir

## snappy
git clone https://github.com/google/snappy.git
cd snappy
bash ./autogen.sh
./configure --prefix=/global/home/users/shubhtuls/local/
make && make install
cd packageDir

## leveldb
git clone https://github.com/google/leveldb.git
cd leveldb
make
cp --preserve=links libleveldb.* /global/home/users/shubhtuls/localTmp/lib/
cp -r include/leveldb /global/home/users/shubhtuls/localTmp/include
cd packageDir
