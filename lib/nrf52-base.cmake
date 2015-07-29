# nRF52 Base CMake file
#
# Configures the project files and environment for any nRF52 project

if(NOT DEFINED DEVICE)
message(FATAL_ERROR "No processor defined")
endif(NOT DEFINED DEVICE)

# Convert to upper case
string(TOUPPER ${DEVICE} DEVICE_U)

# Determine device family
string(REGEX MATCH "^(NRF5[1-2])" CPU_FAMILY_U "${DEVICE_U}")
string(TOLOWER ${CPU_FAMILY_U} CPU_FAMILY_L)

if(NOT DEFINED SOFTDEVICE)
	set(SOFTDEVICE "S132")
	message("No Softdevice defined. Using default: ${SOFTDEVICE}")
endif(NOT DEFINED SOFTDEVICE)

# Determine core type
set(CPU_TYPE "m4")

# Include libraries
#include(${CMAKE_CURRENT_LIST_DIR}/components/toolchain/toolchain.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/components/softdevice/softdevice.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/components/device/device.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/components/ble/ble.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/components/drivers_ext/drivers-ext.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/components/drivers_nrf/drivers-nrf.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/components/libraries/libraries.cmake)


# Set compiler flags
# Common arguments
# --specs=nano.specs -D$(BOARD)
set(COMMON_DEFINITIONS "${OPTIONAL_DEBUG_SYMBOLS} -DNRF52 -D${BOARD}")
set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS} -mcpu=cortex-m4 -mthumb -mabi=aapcs -mfloat-abi=hard -mfpu=fpv4-sp-d16")
#set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS} -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin")
#set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS} -DSWI_DISABLE0 -DSOFTDEVICE_PRESENT -DNRF52 -DBOARD_PCA10036")
#set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS} -DCONFIG_GPIO_AS_PINRESET -DS132 -DBLE_STACK_SUPPORT_REQD")
#set(DEPFLAGS "-MMD -MP")

#if(NOT DEFINED QUIET_BUILD)
#set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS} -Wextra -Wall")
#endif(NOT DEFINED QUIET_BUILD)

# Enable FLTO optimization if required
#if(USE_FLTO)
#	set(OPTFLAGS "-Os -flto")
#else()
#	set(OPTFLAGS "-Os")
#endif()

set(LINKER_SCRIPT ${SOFTDEVICE_LD})

# Build flags
set(CMAKE_C_FLAGS "-std=gnu11 ${COMMON_DEFINITIONS} ${DEPFLAGS}")
set(CMAKE_CXX_FLAGS "${COMMON_DEFINITIONS} ${DEPFLAGS}")
set(CMAKE_ASM_FLAGS "${COMMON_DEFINITIONS} -x assembler-with-cpp")
#set(CMAKE_EXE_LINKER_FLAGS "-Xlinker -L${BASE_LOCATION}/lib/components/toolchain/gcc -T${BASE_LOCATION}/lib/components/toolchain/gcc/nrf52_xxaa.ld")
set(CMAKE_EXE_LINKER_FLAGS "-Xlinker -L${BASE_LOCATION}/lib/components/toolchain/gcc -T${BASE_LOCATION}/lib/components/softdevice/s132/toolchain/armgcc/armgcc_s132_nrf52832_xxaa.ld -lc -Wl,-Map=${CMAKE_PROJECT_NAME}.map -Wl,--gc-sections")

# Set default inclusions
set(LIBS -lc -lnosys ${LIBS})

# Debug Flags
#set(COMMON_DEBUG_FLAGS "-O0 -g -gdwarf-2 -DDEBUG=1")
set(CMAKE_C_FLAGS_DEBUG   "${COMMON_DEBUG_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${COMMON_DEBUG_FLAGS}")
set(CMAKE_ASM_FLAGS_DEBUG "${COMMON_DEBUG_FLAGS}")

# Release Flags
#set(COMMON_RELEASE_FLAGS "${OPTFLAGS} -DNDEBUG=1 -DRELEASE=1")
set(CMAKE_C_FLAGS_RELEASE 	"${COMMON_RELEASE_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "${COMMON_RELEASE_FLAGS}")
set(CMAKE_ASM_FLAGS_RELEASE "${COMMON_RELEASE_FLAGS}")


