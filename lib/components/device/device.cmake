# BLE Module

# Add source files
set(DEVICE_SOURCES
	
)

# Add inclusions
include_directories(${CMAKE_CURRENT_LIST_DIR})

# Create ble library
add_library(device ${DEVICE_SOURCES})