# Serialization module

# Add source files

# Application/codecs
include_directories(${CMAKE_CURRENT_LIST_DIR}/application/codecs/common)
include_directories(${CMAKE_CURRENT_LIST_DIR}/application/codecs/${SOFTDEVICE_L})
include_directories(${CMAKE_CURRENT_LIST_DIR}/application/codecs/${SOFTDEVICE_L}/serializers)
file(GLOB_RECURSE CODEC_COMMON_SRC ${CMAKE_CURRENT_LIST_DIR}/application/codecs/common/*.c)
file(GLOB_RECURSE CODEC_SOFTDEV_SRC ${CMAKE_CURRENT_LIST_DIR}/application/codecs/${SOFTDEVICE_L}/*.c)

# Application/hal
include_directories(${CMAKE_CURRENT_LIST_DIR}/application/hal)
set(APP_HAL_SRC 
    ${CMAKE_CURRENT_LIST_DIR}/application/hal/ser_app_power_system_off.c
    ${CMAKE_CURRENT_LIST_DIR}/application/hal/ser_app_hal_nrf5x.c)

# Application/transport
include_directories(${CMAKE_CURRENT_LIST_DIR}/application/transport)
file(GLOB_RECURSE TRANSPORT_SRC ${CMAKE_CURRENT_LIST_DIR}/application/transport/*.c)

# Common
include_directories(${CMAKE_CURRENT_LIST_DIR}/common/)
include_directories(${CMAKE_CURRENT_LIST_DIR}/common/transport)
file(GLOB COMMON_SRC ${CMAKE_CURRENT_LIST_DIR}/common/*.c)

include_directories(${CMAKE_CURRENT_LIST_DIR}/common/struct_ser/${SOFTDEVICE_L})
file(GLOB COMMON_SOFTDEV_SRC ${CMAKE_CURRENT_LIST_DIR}/common/struct_ser/${SOFTDEVICE_L}/*.c)

# Create nrf driver library
add_library(serialization ${COMMON_SRC} ${COMMON_SOFTDEV_SRC} ${CODEC_COMMON_SRC} ${CODEC_SOFTDEV_SRC} ${TRANSPORT_SRC} ${APP_HAL_SRC})

set(LIBS ${LIBS} serialization)