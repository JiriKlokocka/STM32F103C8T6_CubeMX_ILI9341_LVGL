################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/lv_draw/lv_draw_arc.c \
../lvgl/src/lv_draw/lv_draw_blend.c \
../lvgl/src/lv_draw/lv_draw_img.c \
../lvgl/src/lv_draw/lv_draw_label.c \
../lvgl/src/lv_draw/lv_draw_line.c \
../lvgl/src/lv_draw/lv_draw_mask.c \
../lvgl/src/lv_draw/lv_draw_rect.c \
../lvgl/src/lv_draw/lv_draw_triangle.c \
../lvgl/src/lv_draw/lv_img_buf.c \
../lvgl/src/lv_draw/lv_img_cache.c \
../lvgl/src/lv_draw/lv_img_decoder.c 

OBJS += \
./lvgl/src/lv_draw/lv_draw_arc.o \
./lvgl/src/lv_draw/lv_draw_blend.o \
./lvgl/src/lv_draw/lv_draw_img.o \
./lvgl/src/lv_draw/lv_draw_label.o \
./lvgl/src/lv_draw/lv_draw_line.o \
./lvgl/src/lv_draw/lv_draw_mask.o \
./lvgl/src/lv_draw/lv_draw_rect.o \
./lvgl/src/lv_draw/lv_draw_triangle.o \
./lvgl/src/lv_draw/lv_img_buf.o \
./lvgl/src/lv_draw/lv_img_cache.o \
./lvgl/src/lv_draw/lv_img_decoder.o 

C_DEPS += \
./lvgl/src/lv_draw/lv_draw_arc.d \
./lvgl/src/lv_draw/lv_draw_blend.d \
./lvgl/src/lv_draw/lv_draw_img.d \
./lvgl/src/lv_draw/lv_draw_label.d \
./lvgl/src/lv_draw/lv_draw_line.d \
./lvgl/src/lv_draw/lv_draw_mask.d \
./lvgl/src/lv_draw/lv_draw_rect.d \
./lvgl/src/lv_draw/lv_draw_triangle.d \
./lvgl/src/lv_draw/lv_img_buf.d \
./lvgl/src/lv_draw/lv_img_cache.d \
./lvgl/src/lv_draw/lv_img_decoder.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/lv_draw/lv_draw_arc.o: ../lvgl/src/lv_draw/lv_draw_arc.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_arc.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_draw_blend.o: ../lvgl/src/lv_draw/lv_draw_blend.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_blend.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_draw_img.o: ../lvgl/src/lv_draw/lv_draw_img.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_img.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_draw_label.o: ../lvgl/src/lv_draw/lv_draw_label.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_label.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_draw_line.o: ../lvgl/src/lv_draw/lv_draw_line.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_line.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_draw_mask.o: ../lvgl/src/lv_draw/lv_draw_mask.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_mask.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_draw_rect.o: ../lvgl/src/lv_draw/lv_draw_rect.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_rect.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_draw_triangle.o: ../lvgl/src/lv_draw/lv_draw_triangle.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_draw_triangle.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_img_buf.o: ../lvgl/src/lv_draw/lv_img_buf.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_img_buf.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_img_cache.o: ../lvgl/src/lv_draw/lv_img_cache.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_img_cache.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_draw/lv_img_decoder.o: ../lvgl/src/lv_draw/lv_img_decoder.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_draw/lv_img_decoder.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

