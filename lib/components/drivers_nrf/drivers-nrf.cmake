# nRF Driver Module

# Add source files
set(NRF_DRIVER_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/ble_flash/ble_flash.c
	${CMAKE_CURRENT_LIST_DIR}/clock/nrf_drv_clock.c
	${CMAKE_CURRENT_LIST_DIR}/common/nrf_drv_common.c
	${CMAKE_CURRENT_LIST_DIR}/delay/nrf_delay.c
	${CMAKE_CURRENT_LIST_DIR}/gpiote/nrf_drv_gpiote.c
	${CMAKE_CURRENT_LIST_DIR}/hal/nrf_adc.c
	${CMAKE_CURRENT_LIST_DIR}/hal/nrf_ecb.c
	${CMAKE_CURRENT_LIST_DIR}/hal/nrf_nvmc.c
	${CMAKE_CURRENT_LIST_DIR}/hal/nrf_saadc.c
	${CMAKE_CURRENT_LIST_DIR}/lpcomp/nrf_drv_lpcomp.c
	${CMAKE_CURRENT_LIST_DIR}/ppi/nrf_drv_ppi.c
	${CMAKE_CURRENT_LIST_DIR}/pstorage/pstorage_nosd.c
	${CMAKE_CURRENT_LIST_DIR}/pstorage/pstorage_raw.c
	${CMAKE_CURRENT_LIST_DIR}/pstorage/pstorage.c
	${CMAKE_CURRENT_LIST_DIR}/qdec/nrf_drv_qdec.c
	${CMAKE_CURRENT_LIST_DIR}/radio_config/radio_config.c
	${CMAKE_CURRENT_LIST_DIR}/rng/nrf_drv_rng.c
	${CMAKE_CURRENT_LIST_DIR}/rtc/nrf_drv_rtc.c
	${CMAKE_CURRENT_LIST_DIR}/saadc/nrf_drv_saadc.c
	${CMAKE_CURRENT_LIST_DIR}/sdio/sdio.c
	${CMAKE_CURRENT_LIST_DIR}/spi_master/nrf_drv_spi.c
	${CMAKE_CURRENT_LIST_DIR}/spi_master/spi_5W_master.c
	${CMAKE_CURRENT_LIST_DIR}/spi_slave/spi_slave.c
	${CMAKE_CURRENT_LIST_DIR}/swi/nrf_drv_swi.c
	${CMAKE_CURRENT_LIST_DIR}/timer/nrf_drv_timer.c
	${CMAKE_CURRENT_LIST_DIR}/twi_master/nrf_drv_twi.c
	${CMAKE_CURRENT_LIST_DIR}/twis_slave/nrf_drv_twis.c
	${CMAKE_CURRENT_LIST_DIR}/uart/nrf_drv_uart.c
	${CMAKE_CURRENT_LIST_DIR}/uart/app_uart.c
	${CMAKE_CURRENT_LIST_DIR}/uart/app_uart_fifo.c
	${CMAKE_CURRENT_LIST_DIR}/wdt/nrf_drv_wdt.c
	)

include_directories(
	${CMAKE_CURRENT_LIST_DIR}
	${CMAKE_CURRENT_LIST_DIR}/ble_flash
	${CMAKE_CURRENT_LIST_DIR}/clock
	${CMAKE_CURRENT_LIST_DIR}/common
	${CMAKE_CURRENT_LIST_DIR}/config
	${CMAKE_CURRENT_LIST_DIR}/delay
	${CMAKE_CURRENT_LIST_DIR}/gpiote
	${CMAKE_CURRENT_LIST_DIR}/hal
	${CMAKE_CURRENT_LIST_DIR}/lpcomp
	${CMAKE_CURRENT_LIST_DIR}/ppi
	${CMAKE_CURRENT_LIST_DIR}/pstorage
	${CMAKE_CURRENT_LIST_DIR}/qdec
	${CMAKE_CURRENT_LIST_DIR}/radio_config
	${CMAKE_CURRENT_LIST_DIR}/rng
	${CMAKE_CURRENT_LIST_DIR}/rtc
	${CMAKE_CURRENT_LIST_DIR}/saadc
	${CMAKE_CURRENT_LIST_DIR}/sdio
	${CMAKE_CURRENT_LIST_DIR}/spi_master
	${CMAKE_CURRENT_LIST_DIR}/spi_slave
	${CMAKE_CURRENT_LIST_DIR}/swi
	${CMAKE_CURRENT_LIST_DIR}/timer
	${CMAKE_CURRENT_LIST_DIR}/twi_master
	${CMAKE_CURRENT_LIST_DIR}/twi_slave
	${CMAKE_CURRENT_LIST_DIR}/uart
	${CMAKE_CURRENT_LIST_DIR}/wdt
)

if(NOT DEFINED SOFTDEVICE)
	include_directories(${CMAKE_CURRENT_LIST_DIR}/nrf_soc_nosd)
	set(NRF_DRIVER_NOSD_SOURCES
			${CMAKE_CURRENT_LIST_DIR}/nrf_soc_nosd/nrf_soc.c
	)
endif(NOT DEFINED SOFTDEVICE)

# Create ble library
add_library(drivers-nrf ${NRF_DRIVER_SOURCES} ${NRF_DRIVER_NOSD_SOURCES})