cmake_minimum_required(VERSION 3.13)
include($ENV{PICO_SDK_PATH}external/pico_sdk_import.cmake)
project(my_project)
pico_sdk_init()

add_definitions(-DLIB_PICO_STDIO_UART

#                -DPICO_DEFAULT_UART_TX_PIN=0 
#                -DPICO_DEFAULT_UART_RX_PIN=1
				-DPICO_DEFAULT_UART_BAUD_RATE=9600)

add_executable(picodemo main.c)

target_link_libraries(picodemo pico_stdlib)

pico_add_extra_outputs(picodemo)