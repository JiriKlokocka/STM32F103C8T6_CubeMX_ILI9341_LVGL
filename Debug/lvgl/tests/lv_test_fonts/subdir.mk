################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/tests/lv_test_fonts/font_1.c \
../lvgl/tests/lv_test_fonts/font_2.c \
../lvgl/tests/lv_test_fonts/font_3.c 

OBJS += \
./lvgl/tests/lv_test_fonts/font_1.o \
./lvgl/tests/lv_test_fonts/font_2.o \
./lvgl/tests/lv_test_fonts/font_3.o 

C_DEPS += \
./lvgl/tests/lv_test_fonts/font_1.d \
./lvgl/tests/lv_test_fonts/font_2.d \
./lvgl/tests/lv_test_fonts/font_3.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/tests/lv_test_fonts/font_1.o: ../lvgl/tests/lv_test_fonts/font_1.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/tests/lv_test_fonts/font_1.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/tests/lv_test_fonts/font_2.o: ../lvgl/tests/lv_test_fonts/font_2.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/tests/lv_test_fonts/font_2.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/tests/lv_test_fonts/font_3.o: ../lvgl/tests/lv_test_fonts/font_3.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/tests/lv_test_fonts/font_3.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

