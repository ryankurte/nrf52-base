# Library Module

# Add source files

set(NRF_LIB_SOURCES "")

foreach(LIBRARY IN ITEMS ${LIBRARIES})
	# Hacks for libraries that include things they shouldn't
	if("${LIBRARY}" STREQUAL "timer")
		# TODO: add other timer components if definitions exist
		set(NRF_LIB_SOURCES 
			${NRF_LIB_SOURCES} 
			${CMAKE_CURRENT_LIST_DIR}/timer/app_timer.c
			)
		include_directories(${CMAKE_CURRENT_LIST_DIR}/timer)
	else()
		message("Added library: ${LIBRARY} at: ${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}")
		file(GLOB_RECURSE CURRENT_SOURCES ${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/*.c)
		set(NRF_LIB_SOURCES ${NRF_LIB_SOURCES} ${CURRENT_SOURCES})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${LIBRARY})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/src)
	endif()
endforeach(LIBRARY IN ${LIBRARIES})

# Create ble library
add_library(libraries ${NRF_LIB_SOURCES})

set(LIBS ${LIBS} libraries)