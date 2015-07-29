# Base NRF52 CMake file
#
# This can be used as is as a project base, or by adding the nrf52-base
# repository as a submodule to another project, copying this CMakeLists file
# to the top level directory, and updating the BASE_LOCATION variable to reflect this
# change

###### Project Environment #####

# Set minimum CMake version
cmake_minimum_required(VERSION 2.8.4)

##### Project Setup #####

# Set our output target
set(TARGET nrf52-test)

# Configure project and languages
project(${TARGET} C CXX ASM)

# Set efm32-base project location
set(BASE_LOCATION ${PROJECT_SOURCE_DIR})

# Set the compiler (must be prior to project setup)
include(${BASE_LOCATION}/lib/arm-gcc.cmake)

# Set device
if(NOT DEVICE)
set(DEVICE nRF52832)
set(BOARD BOARD_PCA10036)
endif()


# Set build
if(NOT CMAKE_BUILD_TYPE)
set(CMAKE_BUILD_TYPE DEBUG)
endif()

set(QUIET_BUILD "")

##### Files #####

# Add project headers
include_directories(${BASE_LOCATION}/work/include)

# Add project sources
set(SOURCES
	${BASE_LOCATION}/work/source/main.c
	${BASE_LOCATION}/work/source/bsp.c
	${BASE_LOCATION}/work/source/bsp_btn_ble.c
)

##### Modules #####

# Libraries can be added to the LIBS variable
# or manually included here.
# ie. include(${BASE_LOCATION}/my-cool-module/my-cool-module.cmake)

# nRF components enabled here
# Check out the related component folders for options
set(DRIVERS_NRF hal common delay config gpiote trace pstorage timer ble_flash uart)
set(LIBRARIES util trace timer scheduler button uart fifo)
set(BLE_MODULES ble_advertising)
set(BLE_SERVICES ble_nus)

# Add base libs (emlib, CMSIS, device files)
include(${BASE_LOCATION}/lib/nrf52-base.cmake)

##### Outputs #####

# Generate executable and link
add_executable(${TARGET} ${SOURCES})
target_link_libraries(${TARGET} ${LIBS})

##### Post build #####

# Add post build commands
include(${BASE_LOCATION}/lib/post-build.cmake)

# Add JLink commands
include(${BASE_LOCATION}/lib/jlink.cmake)

