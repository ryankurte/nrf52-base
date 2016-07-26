# Softdevice inclusion

include_directories(
	${CMAKE_CURRENT_LIST_DIR}
	${CMAKE_CURRENT_LIST_DIR}/gcc
    ${CMAKE_CURRENT_LIST_DIR}/CMSIS/Include
	)

set(TOOLCHAIN_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/system_${CPU_FAMILY_L}.c
)

set(STARTUP_FILE ${CMAKE_CURRENT_LIST_DIR}/gcc/gcc_startup_${CPU_FAMILY_L}.s)

set(LINKER_TEMPLATE_LOC ${CMAKE_CURRENT_LIST_DIR}/gcc/)

set(BASE_LD ${CMAKE_CURRENT_LIST_DIR}/gcc/${CPU_FAMILY_L}_xxaa.ld)

add_library(toolchain ${STARTUP_FILE} ${TOOLCHAIN_SOURCES})

set(LIBS ${LIBS} toolchain)
