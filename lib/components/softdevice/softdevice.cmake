# Softdevice inclusion

if(DEFINED SOFTDEVICE)

include_directories(${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler)

string(TOLOWER ${SOFTDEVICE} SOFTDEVICE_L)

set(SOFTDEVICE_VERSION "1.0.0-3.alpha")

set(SOFTDEVICE_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler/softdevice_handler_appsh.c
	${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler/softdevice_handler.c
)

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/headers
	${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/headers/nrf52
	)

set(SOFTDEVICE_LD ${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/toolchain/armgcc/armgcc_${SOFTDEVICE_L}_${DEVICE_L}_xxaa.ld)

set(SOFTDEVICE_HEX ${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/hex/${SOFTDEVICE_L}_${CPU_FAMILY_L}_${SOFTDEVICE_VERSION}_softdevice.hex)
set(SOFTDEVICE_BIN ${SOFTDEVICE_L}_${CPU_FAMILY_L}_${SOFTDEVICE_VERSION}_softdevice.bin)

add_custom_target(softdevice-bin ALL COMMAND ${OBJCOPY} -I ihex -O binary ${SOFTDEVICE_HEX} ${SOFTDEVICE_BIN})

add_library(softdevice ${SOFTDEVICE_SOURCES})

set(LIBS ${LIBS} softdevice)

endif(DEFINED SOFTDEVICE)