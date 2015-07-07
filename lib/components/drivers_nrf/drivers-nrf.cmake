# BLE Module

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
	${CMAKE_CURRENT_LIST_DIR}/nrf_soc_nosd/nrf_soc.c
	${CMAKE_CURRENT_LIST_DIR}/ppi/nrf_drv_ppi.c
	${CMAKE_CURRENT_LIST_DIR}/pstorage/pstorage_nosd.c
	${CMAKE_CURRENT_LIST_DIR}/pstorage/pstorage_raw.c
	${CMAKE_CURRENT_LIST_DIR}/pstorage/pstorage.c
	${CMAKE_CURRENT_LIST_DIR}/nrf_drv_qdec.c
	${CMAKE_CURRENT_LIST_DIR}/radio_config.c
	${CMAKE_CURRENT_LIST_DIR}/rng/nrf_drv_rng.c
	${CMAKE_CURRENT_LIST_DIR}/rtc/nrf_drv_rtc.c
	${CMAKE_CURRENT_LIST_DIR}/saadc/nrf_drv_saadc.c
	${CMAKE_CURRENT_LIST_DIR}/sdio/sdio.c
	${CMAKE_CURRENT_LIST_DIR}/spi_master/nrf_drv_spi.c
	${CMAKE_CURRENT_LIST_DIR}/spi/spi_5W_master.c
	${CMAKE_CURRENT_LIST_DIR}/spi/spi_slave.c
	${CMAKE_CURRENT_LIST_DIR}/swi/nrf_drv_swi.c
	${CMAKE_CURRENT_LIST_DIR}/timer/nrf_drv_timer.c
	${CMAKE_CURRENT_LIST_DIR}/twi_master/nrf_drv_twi.c
	${CMAKE_CURRENT_LIST_DIR}/twi_slave/nrf_drv_twis.c
	${CMAKE_CURRENT_LIST_DIR}/uart/nrf_drv_uart.c
	${CMAKE_CURRENT_LIST_DIR}/uart/app_uart.c
	${CMAKE_CURRENT_LIST_DIR}/uart/app_uart_fifo.c
	${CMAKE_CURRENT_LIST_DIR}/wdt/nrf_drv_wdt.c
)

include_directories(
	${CMAKE_CURRENT_LIST_DIR}
	)

# Create ble library
add_library(ble ${NRF_DRIVER_SOURCES})