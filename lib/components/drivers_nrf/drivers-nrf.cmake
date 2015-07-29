# nRF Driver Module

# Add source files
set(NRF_DRIVER_SOURCES "")

foreach(DRIVER IN ITEMS ${DRIVERS_NRF})
		if("${DRIVER}" STREQUAL "uart")
		# TODO: add other uart components somehow
		set(NRF_DRIVER_SOURCES 
			${NRF_DRIVER_SOURCES} 
			${CMAKE_CURRENT_LIST_DIR}/uart/nrf_drv_uart.c
			)
		include_directories(${CMAKE_CURRENT_LIST_DIR}/uart)
	else()
		message("Added driver: ${DRIVER} at: ${CMAKE_CURRENT_LIST_DIR}/${DRIVER}")
		file(GLOB_RECURSE CURRENT_SOURCES ${CMAKE_CURRENT_LIST_DIR}/${DRIVER}/*.c)
		set(NRF_DRIVER_SOURCES ${NRF_DRIVER_SOURCES} ${CURRENT_SOURCES})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${DRIVER})
	endif()
endforeach(DRIVER IN ITEMS ${DRIVERS_NRF})

# Create nrf driver library
add_library(drivers-nrf ${NRF_DRIVER_SOURCES} ${NRF_DRIVER_NOSD_SOURCES})

set(LIBS ${LIBS} drivers-nrf)