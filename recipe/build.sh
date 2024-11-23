CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

cmake -G "Ninja" -B build \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX \
      -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX \
      -D Python3_FIND_STRATEGY=LOCATION \
      -D Python3_ROOT_DIR=${PREFIX} \
      -D Python3_EXECUTABLE=$PYTHON \
      -D PYTHON_MODULE_EXTENSION=`python -c 'import sysconfig; print(sysconfig.get_config_var("EXT_SUFFIX"))'` \
      -D NG_INSTALL_DIR_INCLUDE:FILEPATH=$PREFIX/include/netgen \
      -D NG_INSTALL_DIR_PYTHON:FILEPATH=$SP_DIR \
      -D NG_INSTALL_DIR_BIN=bin \
      -D NG_INSTALL_DIR_LIB=lib \
      -D NG_INSTALL_DIR_CMAKE:FILEPATH=lib/cmake/netgen \
      -D NG_INSTALL_DIR_RES=share \
      -D USE_NATIVE_ARCH:BOOL=OFF \
      -D USE_OCC:BOOL=ON \
      -D USE_PYTHON:BOOL=ON \
      -D USE_GUI:BOOL=OFF \
      -D USE_SUPERBUILD:BOOL=OFF \
      -D PREFER_SYSTEM_PYBIND11=ON \
      -D BUILD_STUB_FILES:BOOL=OFF

ninja -C build install

