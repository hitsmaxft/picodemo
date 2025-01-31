# Pico Demo Project

This project demonstrates how to print "Hello, World!" to UART0 on a Raspberry Pi Pico, looping with a 1-second sleep.

## Requirements

- Raspberry Pi Pico
- USB cable
- CMake
- ARM GCC Compiler
- Pico SDK

## Setup

1. **Install the Pico SDK**: Follow the instructions from the [official Raspberry Pi Pico SDK documentation](https://github.com/raspberrypi/pico-sdk).

2. **Create the Project Directory**:
    ```sh
    mkdir -p ~/pico/picodemo
    cd ~/pico/picodemo
    ```

3. **Create `CMakeLists.txt`**:
    ```cmake
    cmake_minimum_required(VERSION 3.13)
    include(pico_sdk_import.cmake)

    project(picodemo)

    pico_sdk_init()

    add_executable(picodemo
        main.c
    )

    target_link_libraries(picodemo pico_stdlib)

    pico_add_extra_outputs(picodemo)
    ```

4. **Create `main.c`**:
    ```c
    #include "pico/stdlib.h"

    int main() {
        stdio_init_all();
        while (true) {
            printf("Hello, World!\n");
            sleep_ms(1000);
        }
        return 0;
    }
    ```

5. **Build the Project**:
    ```sh
    mkdir build
    cd build
    cmake ..
    make
    ```

6. **Upload to Pico**:
    - Hold the BOOTSEL button on your Pico and connect it to your computer via USB.
    - Copy the generated `picodemo.uf2` file from the `build` directory to the Pico's storage.

## Running the Demo

Once the Pico reboots, it will start printing "Hello, World!" to UART0 every second. You can use a serial monitor (e.g., `minicom`, `screen`, or the Arduino IDE's Serial Monitor) to view the output.