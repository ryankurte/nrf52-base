# Softdevice inclusion

include_directories(
	${CMAKE_CURRENT_LIST_DIR}
	${CMAKE_CURRENT_LIST_DIR}/gcc
	)

set(TOOLCHAIN_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/system_nrf52.c
)

set(STARTUP_FILE ${CMAKE_CURRENT_LIST_DIR}/gcc/gcc_startup_nrf52.s)

set(BASE_LINKER_FILE ${CMAKE_CURRENT_LIST_DIR}/gcc/nrf5x_common.ld)
configure_file(${BASE_LINKER_FILE} ${CMAKE_CURRENT_BINARY_DIR})

set(COMMON_LINKER_FILE ${CMAKE_CURRENT_LIST_DIR}/gcc/nrf52_common.ld)
configure_file(${COMMON_LINKER_FILE} ${CMAKE_CURRENT_BINARY_DIR})

set(VERSION_LINKER_FILE ${CMAKE_CURRENT_LIST_DIR}/gcc/nrf52_xxaa.ld)
configure_file(${VERSION_LINKER_FILE} ${CMAKE_CURRENT_BINARY_DIR})

add_library(toolchain ${TOOLCHAIN_SOURCES})

set(LIBS ${LIBS} toolchain)
