################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/lv_themes/lv_theme.c \
../lvgl/src/lv_themes/lv_theme_empty.c \
../lvgl/src/lv_themes/lv_theme_material.c \
../lvgl/src/lv_themes/lv_theme_mono.c \
../lvgl/src/lv_themes/lv_theme_template.c 

OBJS += \
./lvgl/src/lv_themes/lv_theme.o \
./lvgl/src/lv_themes/lv_theme_empty.o \
./lvgl/src/lv_themes/lv_theme_material.o \
./lvgl/src/lv_themes/lv_theme_mono.o \
./lvgl/src/lv_themes/lv_theme_template.o 

C_DEPS += \
./lvgl/src/lv_themes/lv_theme.d \
./lvgl/src/lv_themes/lv_theme_empty.d \
./lvgl/src/lv_themes/lv_theme_material.d \
./lvgl/src/lv_themes/lv_theme_mono.d \
./lvgl/src/lv_themes/lv_theme_template.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/lv_themes/lv_theme.o: ../lvgl/src/lv_themes/lv_theme.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_themes/lv_theme.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_themes/lv_theme_empty.o: ../lvgl/src/lv_themes/lv_theme_empty.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_themes/lv_theme_empty.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_themes/lv_theme_material.o: ../lvgl/src/lv_themes/lv_theme_material.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_themes/lv_theme_material.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_themes/lv_theme_mono.o: ../lvgl/src/lv_themes/lv_theme_mono.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_themes/lv_theme_mono.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_themes/lv_theme_template.o: ../lvgl/src/lv_themes/lv_theme_template.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_themes/lv_theme_template.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

