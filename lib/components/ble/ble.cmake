# BLE Module

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/common
	)

# Add source files
set(BLE_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/common/ble_advdata.c
	${CMAKE_CURRENT_LIST_DIR}/common/ble_advdata_parser.c
	${CMAKE_CURRENT_LIST_DIR}/common/ble_conn_params.c
	${CMAKE_CURRENT_LIST_DIR}/common/ble_srv_common.c
)

# Add modules
foreach(MODULE IN ITEMS ${BLE_MODULES})
	message("Added ble module: ${MODULE} at: ${CMAKE_CURRENT_LIST_DIR}/${MODULE}")
	file(GLOB_RECURSE CURRENT_SOURCES ${CMAKE_CURRENT_LIST_DIR}/${MODULE}/*.c)
	set(BLE_SOURCES ${BLE_SOURCES} ${CURRENT_SOURCES})
	include_directories(${CMAKE_CURRENT_LIST_DIR}/${MODULE})
endforeach(MODULE IN ITEMS ${BLE_MODULES})

# Add services
foreach(SERVICE IN ITEMS ${BLE_SERVICES})
	message("Added ble service: ${SERVICE} at: ${CMAKE_CURRENT_LIST_DIR}/${SERVICE}")
	file(GLOB_RECURSE CURRENT_SOURCES ${CMAKE_CURRENT_LIST_DIR}/ble_services/${SERVICE}/*.c)
	set(BLE_SOURCES ${BLE_SOURCES} ${CURRENT_SOURCES})
	include_directories(${CMAKE_CURRENT_LIST_DIR}/ble_services/${SERVICE})
endforeach(SERVICE IN ITEMS ${BLE_SERVICES})

# Create ble library
add_library(ble ${BLE_SOURCES})