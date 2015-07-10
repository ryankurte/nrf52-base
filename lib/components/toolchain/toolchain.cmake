# Softdevice inclusion

include_directories(
	${CMAKE_CURRENT_LIST_DIR}
	${CMAKE_CURRENT_LIST_DIR}/gcc
	)

set(TOOLCHAIN_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/system_nrf52.c
)

set(STARTUP_FILE ${CMAKE_CURRENT_LIST_DIR}/gcc/gcc_startup_nrf52.s)

set(LINKER_FILE ${CMAKE_CURRENT_LIST_DIR}/gcc/nrf52_xxaa.ld)


add_library(toolchain ${TOOLCHAIN_SOURCES})

