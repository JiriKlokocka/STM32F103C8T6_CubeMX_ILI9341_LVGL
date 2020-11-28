################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/lv_core/lv_disp.c \
../lvgl/src/lv_core/lv_group.c \
../lvgl/src/lv_core/lv_indev.c \
../lvgl/src/lv_core/lv_obj.c \
../lvgl/src/lv_core/lv_refr.c \
../lvgl/src/lv_core/lv_style.c 

OBJS += \
./lvgl/src/lv_core/lv_disp.o \
./lvgl/src/lv_core/lv_group.o \
./lvgl/src/lv_core/lv_indev.o \
./lvgl/src/lv_core/lv_obj.o \
./lvgl/src/lv_core/lv_refr.o \
./lvgl/src/lv_core/lv_style.o 

C_DEPS += \
./lvgl/src/lv_core/lv_disp.d \
./lvgl/src/lv_core/lv_group.d \
./lvgl/src/lv_core/lv_indev.d \
./lvgl/src/lv_core/lv_obj.d \
./lvgl/src/lv_core/lv_refr.d \
./lvgl/src/lv_core/lv_style.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/lv_core/lv_disp.o: ../lvgl/src/lv_core/lv_disp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_core/lv_disp.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_core/lv_group.o: ../lvgl/src/lv_core/lv_group.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_core/lv_group.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_core/lv_indev.o: ../lvgl/src/lv_core/lv_indev.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_core/lv_indev.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_core/lv_obj.o: ../lvgl/src/lv_core/lv_obj.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_core/lv_obj.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_core/lv_refr.o: ../lvgl/src/lv_core/lv_refr.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_core/lv_refr.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_core/lv_style.o: ../lvgl/src/lv_core/lv_style.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_core/lv_style.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

