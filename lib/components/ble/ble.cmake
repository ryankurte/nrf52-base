# BLE Module

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/common
	)

# Add source files
set(BLE_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/common/ble_advdata.c
	${CMAKE_CURRENT_LIST_DIR}/ble_advertising/ble_advertising.c
	${CMAKE_CURRENT_LIST_DIR}/common/ble_conn_params.c
	${CMAKE_CURRENT_LIST_DIR}/ble_services/ble_nus/ble_nus.c
	${CMAKE_CURRENT_LIST_DIR}/common/ble_srv_common.c
)

# Create ble library
add_library(ble ${BLE_SOURCES})