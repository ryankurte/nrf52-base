# Softdevice inclusion

if(DEFINED SOFTDEVICE)

include_directories(${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler)

string(TOLOWER ${SOFTDEVICE} SOFTDEVICE_L)

set(SOFTDEVICE_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler/softdevice_handler_appsh.c
	${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler/softdevice_handler.c
)

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/headers
	${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/headers/nrf52
	)

set(SOFTDEVICE_LD ${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/toolchain/armgcc/armgcc_${SOFTDEVICE_L}_nrf52832_xxaa.ld)

add_library(softdevice ${SOFTDEVICE_SOURCES})

set(LIBS ${LIBS} softdevice)

endif(DEFINED SOFTDEVICE)