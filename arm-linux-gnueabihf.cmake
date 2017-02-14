##
# @attention Momentum Machines Company confidential.
# Dissemination of this information or reproduction of this material is strictly
# forbidden unless prior written permission is obtained from Momentum Machines Company.
#
# @abstract This file defiles cross-compile toolchain for arm-linux-gnueabihf
##

# target Linux OS
set( CMAKE_SYSTEM_NAME Linux )

# set the compiler root path and child path
set( CC_PREFIX arm-linux-gnueabihf )
set( CC_ROOT_PATH /usr/${CC_PREFIX} )

# find compiler binaries
find_program( CMAKE_C_COMPILER ${CC_PREFIX}-gcc-4.8 )
find_program( CMAKE_CXX_COMPILER ${CC_PREFIX}-g++-4.8 )
find_program( CMAKE_AR ${CC_PREFIX}-ar )
find_program( CMAKE_RANLIB ${CC_PREFIX}-ranlib )
set( CMAKE_FIND_ROOT_PATH ${CC_ROOT_PATH} )

# add cross-compile flags (C and C++)
add_compile_options( -fPIC -mcpu=cortex-a8 -march=armv7-a )

# search for programs in the build host directories
set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
# for libraries and headers in the target directories
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )

# Boost location
set( BOOST_ROOT ${CC_ROOT_PATH} )
