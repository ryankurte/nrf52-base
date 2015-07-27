#ARM none eabi gcc toolchain configuration

# We are cross compiling so we don't want compiler tests to run, as they will fail
include(CMakeForceCompiler)

# Indicate we aren't compiling for an OS
set(CMAKE_SYSTEM_NAME Generic)

# Set processor type
set(CMAKE_SYSTEM_PROCESSOR arm)

# Set compiler paths. We force set so it doesn't run tests
CMAKE_FORCE_C_COMPILER(${COMPILER_PREFIX}arm-none-eabi-gcc GNU)
CMAKE_FORCE_CXX_COMPILER(${COMPILER_PREFIX}arm-none-eabi-g++ GNU)

set(CMAKE_ASM_COMPILER ${COMPILER_PREFIX}arm-none-eabi-g++)
set(CMAKE_RANLIB ${COMPILER_PREFIX}arm-none-eabi-ranlib)
set(CMAKE_AR ${COMPILER_PREFIX}arm-none-eabi-ar)

#set(CMAKE_C_LINK_EXECUTABLE ${COMPILER_PREFIX}arm-none-eabi-ld)
#set(CMAKE_CXX_LINK_EXECUTABLE ${COMPILER_PREFIX}arm-none-eabi-ld)

# Set other tools
set(OBJSIZE ${COMPILER_PREFIX}arm-none-eabi-size)
set(OBJCOPY ${COMPILER_PREFIX}arm-none-eabi-objcopy)
set(OBJDUMP ${COMPILER_PREFIX}arm-none-eabi-objdump)
set(DEBUGGER ${COMPILER_PREFIX}arm-none-eabi-gdb)

# Remove preset linker flags
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "") 
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") 
set(CMAKE_SHARED_LIBRARY_LINK_ASM_FLAGS "")

# Set library options
set(SHARED_LIBS OFF)
set(STATIC_LIBS ON)
