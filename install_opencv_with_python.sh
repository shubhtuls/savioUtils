#!/bin/bash -i

# clone opencv
git clone https://github.com/s-gupta/opencv.git
cd opencv
git checkout v2.4.9

# Load the following modules
cd opencv
module load gcc
module load cmake
module load python/2.7.3
module load numpy/1.8.1
mkdir build
cd build
export PYTHON_EXECUTABLE=$(readlink -e $(which python))
export PYTHON_INCLUDE_PATH=${PYTHON_EXECUTABLE%/*/*}/include/python2.7
export PYTHON_INCLUDE_DIRS=${PYTHON_EXECUTABLE%/*/*}/include/python2.7
export PYTHON_LIBRARY=${PYTHON_EXECUTABLE%/*/*}/lib/libpython2.7.so
export PYTHON_NUMPY_INCLUDE_DIR=$NUMPY_DIR/lib/python2.7/site-packages/numpy/core/include/
export PYTHON_PACKAGES_PATH=install #${PYTHON_EXECUTABLE%/*/*}/lib/python2.7/site-packages

cmake  \
-DWITH_OPENCL=OFF  \
-DWITH_OPENCLAMDBLAS=OFF  \
-DWITH_OPENCLAMDFFT=OFF  \
-DWITH_CUDA=OFF  \
-DPYTHON_EXECUTABLE=$PYTHON_EXECUTABLE  \
-DPYTHON_INCLUDE_PATH=$PYTHON_INCLUDE_PATH \
-DPYTHON_LIBRARY=$PYTHON_LIBRARY \
-DPYTHON_NUMPY_INCLUDE_DIR=$PYTHON_NUMPY_INCLUDE_DIR \
-DPYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH \
-DCMAKE_INSTALL_PREFIX=install \
-Wno-dev ../

make -j 16
make install
