################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/lv_misc/lv_anim.c \
../lvgl/src/lv_misc/lv_area.c \
../lvgl/src/lv_misc/lv_async.c \
../lvgl/src/lv_misc/lv_bidi.c \
../lvgl/src/lv_misc/lv_color.c \
../lvgl/src/lv_misc/lv_debug.c \
../lvgl/src/lv_misc/lv_fs.c \
../lvgl/src/lv_misc/lv_gc.c \
../lvgl/src/lv_misc/lv_ll.c \
../lvgl/src/lv_misc/lv_log.c \
../lvgl/src/lv_misc/lv_math.c \
../lvgl/src/lv_misc/lv_mem.c \
../lvgl/src/lv_misc/lv_printf.c \
../lvgl/src/lv_misc/lv_task.c \
../lvgl/src/lv_misc/lv_templ.c \
../lvgl/src/lv_misc/lv_txt.c \
../lvgl/src/lv_misc/lv_txt_ap.c \
../lvgl/src/lv_misc/lv_utils.c 

OBJS += \
./lvgl/src/lv_misc/lv_anim.o \
./lvgl/src/lv_misc/lv_area.o \
./lvgl/src/lv_misc/lv_async.o \
./lvgl/src/lv_misc/lv_bidi.o \
./lvgl/src/lv_misc/lv_color.o \
./lvgl/src/lv_misc/lv_debug.o \
./lvgl/src/lv_misc/lv_fs.o \
./lvgl/src/lv_misc/lv_gc.o \
./lvgl/src/lv_misc/lv_ll.o \
./lvgl/src/lv_misc/lv_log.o \
./lvgl/src/lv_misc/lv_math.o \
./lvgl/src/lv_misc/lv_mem.o \
./lvgl/src/lv_misc/lv_printf.o \
./lvgl/src/lv_misc/lv_task.o \
./lvgl/src/lv_misc/lv_templ.o \
./lvgl/src/lv_misc/lv_txt.o \
./lvgl/src/lv_misc/lv_txt_ap.o \
./lvgl/src/lv_misc/lv_utils.o 

C_DEPS += \
./lvgl/src/lv_misc/lv_anim.d \
./lvgl/src/lv_misc/lv_area.d \
./lvgl/src/lv_misc/lv_async.d \
./lvgl/src/lv_misc/lv_bidi.d \
./lvgl/src/lv_misc/lv_color.d \
./lvgl/src/lv_misc/lv_debug.d \
./lvgl/src/lv_misc/lv_fs.d \
./lvgl/src/lv_misc/lv_gc.d \
./lvgl/src/lv_misc/lv_ll.d \
./lvgl/src/lv_misc/lv_log.d \
./lvgl/src/lv_misc/lv_math.d \
./lvgl/src/lv_misc/lv_mem.d \
./lvgl/src/lv_misc/lv_printf.d \
./lvgl/src/lv_misc/lv_task.d \
./lvgl/src/lv_misc/lv_templ.d \
./lvgl/src/lv_misc/lv_txt.d \
./lvgl/src/lv_misc/lv_txt_ap.d \
./lvgl/src/lv_misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/lv_misc/lv_anim.o: ../lvgl/src/lv_misc/lv_anim.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_anim.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_area.o: ../lvgl/src/lv_misc/lv_area.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_area.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_async.o: ../lvgl/src/lv_misc/lv_async.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_async.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_bidi.o: ../lvgl/src/lv_misc/lv_bidi.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_bidi.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_color.o: ../lvgl/src/lv_misc/lv_color.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_color.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_debug.o: ../lvgl/src/lv_misc/lv_debug.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_debug.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_fs.o: ../lvgl/src/lv_misc/lv_fs.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_fs.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_gc.o: ../lvgl/src/lv_misc/lv_gc.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_gc.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_ll.o: ../lvgl/src/lv_misc/lv_ll.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_ll.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_log.o: ../lvgl/src/lv_misc/lv_log.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_log.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_math.o: ../lvgl/src/lv_misc/lv_math.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_math.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_mem.o: ../lvgl/src/lv_misc/lv_mem.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_mem.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_printf.o: ../lvgl/src/lv_misc/lv_printf.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_printf.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_task.o: ../lvgl/src/lv_misc/lv_task.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_task.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_templ.o: ../lvgl/src/lv_misc/lv_templ.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_templ.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_txt.o: ../lvgl/src/lv_misc/lv_txt.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_txt.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_txt_ap.o: ../lvgl/src/lv_misc/lv_txt_ap.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_txt_ap.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
lvgl/src/lv_misc/lv_utils.o: ../lvgl/src/lv_misc/lv_utils.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -DDEBUG -c -I../Core/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Device/ST/STM32F1xx/Include -IC:/Users/KlokockaJir/STM32Cube/Repository/STM32Cube_FW_F1_V1.8.3/Drivers/CMSIS/Include -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/lvgl_init_f103" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl/ILI9341" -I"C:/stm32/STM32CubeIDE/WSpace102/BluePill_ILI_lvgl" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"lvgl/src/lv_misc/lv_utils.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

