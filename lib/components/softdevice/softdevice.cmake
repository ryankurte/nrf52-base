# Softdevice inclusion

include_directories(${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler)

set(SOFTDEVICE_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler/softdevice_handler_appsh.c
	${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler/softdevice_handler.c
)

if(${SOFTDEVICE} EQUAL "S132")

include_directories(${CMAKE_CURRENT_LIST_DIR}/s132/headers)

set(SOFTDEVICE_LD ${CMAKE_CURRENT_LIST_DIR}/s132/toolchain/armgcc/armgcc_s132_nrf52832_xxaa.ld)

elseif(${SOFTDEVICE} EQUAL "S212")

include_directories(${CMAKE_CURRENT_LIST_DIR}/s212/headers)

set(SOFTDEVICE_LD ${CMAKE_CURRENT_LIST_DIR}/s212/toolchain/armgcc/armgcc/s21_nrf52832_xxaa.ld)

endif()

add_library(softdevice ${SOFTDEVICE_SOURCES})

