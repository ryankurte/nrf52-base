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

if(NOT DEFINED FLASH_START)
	set(FLASH_START 0x00000000)
	message("No FLASH_START defined. Using default: ${FLASH_START}")
endif(NOT DEFINED FLASH_START)

# Determine core type
set(CPU_TYPE "m4")

# Include libraries
include(${CMAKE_CURRENT_LIST_DIR}/components/ble/ble.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/components/device/device.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/components/drivers_ext/drivers-ext.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/components/drivers_nrf/drivers-nrf.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/components/libraries/libraries.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/components/softdevice/softdevice.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/components/toolchain/toolchain.cmake)

# Set compiler flags
# Common arguments
set(COMMON_DEFINITIONS "-D${DEVICE} ${OPTIONAL_DEBUG_SYMBOLS}")
set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS} -DSWI_DISABLE0 -DSOFTDEVICE_PRESENT -DNRF52 -DBOARD_PCA10036")
set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS}  -DCONFIG_GPIO_AS_PINRESET -DS132 -DBLE_STACK_SUPPORT_REQD")
set(DEPFLAGS "-MMD -MP")

if(NOT DEFINED QUIET_BUILD)
set(COMMON_DEFINITIONS "${COMMON_DEFINITIONS} -Wextra -Wall")
endif(NOT DEFINED QUIET_BUILD)

# Enable FLTO optimization if required
if(USE_FLTO)
	set(OPTFLAGS "-Os -flto")
else()
	set(OPTFLAGS "-Os")
endif()

# Build flags
set(CMAKE_C_FLAGS "-std=gnu99 ${COMMON_DEFINITIONS} -mcpu=cortex-m4 -mthumb -mabi=aapcs --std=gnu99 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin --short-enums --specs=nano.specs ${DEPFLAGS}")
set(CMAKE_CXX_FLAGS "${COMMON_DEFINITIONS} ${CPU_FIX} --specs=nano.specs ${DEPFLAGS}")
set(CMAKE_ASM_FLAGS "${COMMON_DEFINITIONS} -x assembler-with-cpp")
set(CMAKE_EXE_LINKER_FLAGS "${COMMON_DEFINITIONS} -Xlinker -T${LINKER_SCRIPT} -mthumb -mabi=aapcs -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 --specs=nano.specs -lc -lnosys -Wl,-Map=${CMAKE_PROJECT_NAME}.map -Wl,--gc-sections")

# Set default inclusions
set(LIBS -lgcc -lc -lnosys ${LIBS})

# Debug Flags
set(COMMON_DEBUG_FLAGS "-O0 -g -gdwarf-2")
set(CMAKE_C_FLAGS_DEBUG   "${COMMON_DEBUG_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${COMMON_DEBUG_FLAGS}")
set(CMAKE_ASM_FLAGS_DEBUG "${COMMON_DEBUG_FLAGS}")

# Release Flags
set(COMMON_RELEASE_FLAGS "${OPTFLAGS} -DNDEBUG=1 -DRELEASE=1")
set(CMAKE_C_FLAGS_RELEASE 	"${COMMON_RELEASE_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "${COMMON_RELEASE_FLAGS}")
set(CMAKE_ASM_FLAGS_RELEASE "${COMMON_RELEASE_FLAGS}")


