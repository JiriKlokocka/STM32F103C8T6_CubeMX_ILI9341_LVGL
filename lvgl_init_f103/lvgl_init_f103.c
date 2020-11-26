/*
 * lvgl_init_f407.c
 *
 *  Created on: Nov 15, 2020
 *      Author: KlokockaJir
 */

#include "ili9341.h"
#include "main.h"
#include "lvgl_init_f103.h"
#include "lv_conf.h"
#include "lvgl/lvgl.h"
#include <string.h>
#include "stm32f1xx.h"



extern TIM_HandleTypeDef htim4;
extern DMA_HandleTypeDef hdma_memtomem_dma2_stream0;


/* -------------------  display ---------------  */

static void LCD_Flush(lv_disp_drv_t * drv, const lv_area_t * area, lv_color_t * color_p);
static void DMA_TransferComplete(DMA_HandleTypeDef *han);

lv_disp_drv_t disp_drv;
static volatile uint32_t t_saved = 0;

#define USE_DBL_BUFF	0
#define BUFF_LINES 		5 //20 for double buffer, 40 for single buffer (to fit to RAM)
#define USE_DMA 		0
#define USE_DMA_IRQ		0

/* -------------------  touchpad ---------------  */


uint8_t encBtnFlag = 0;
volatile int16_t encoderStep = 0;


lv_indev_t * indev_encoder;

//static lv_indev_state_t encoder_state;

static bool encoder_read(lv_indev_drv_t * drv, lv_indev_data_t *data);


/* -------------------  DISPLAY ---------------  */
void monitor_cb(lv_disp_drv_t * d, uint32_t t, uint32_t p){
	t_saved = t;
}


void lv_lcd_init() {


	/* define & init  buffers */
	static lv_disp_buf_t buf;
#if USE_DBL_BUFF
	static lv_color_t disp_buf1[LV_HOR_RES_MAX * BUFF_LINES];
	static lv_color_t disp_buf2[LV_HOR_RES_MAX * BUFF_LINES];
	lv_disp_buf_init(&buf, disp_buf1, disp_buf2, LV_HOR_RES_MAX * BUFF_LINES);
#else
	static lv_color_t disp_buf1[LV_HOR_RES_MAX * BUFF_LINES];
	lv_disp_buf_init(&buf, disp_buf1, NULL, LV_HOR_RES_MAX * BUFF_LINES);
#endif

	ILI9341_Init();  		/* Init LCD hardware */
	ILI9341_Set_Rotation(SCREEN_HORIZONTAL_2);



	lv_disp_drv_init(&disp_drv);		/*Basic driver initialization*/
	disp_drv.buffer = &buf;				/*Set an initialized buffer*/
	disp_drv.flush_cb = LCD_Flush;		/*Set a flush callback to draw to the display*/
	disp_drv.monitor_cb = monitor_cb;
	lv_disp_drv_register(&disp_drv);

	//register DMA IRQ callback
#if USE_DMA_IRQ
	hdma_memtomem_dma2_stream0.XferCpltCallback = DMA_TransferComplete;
#endif

}

/**
 * Flush a color buffer
 * @param x1 left coordinate of the rectangle
 * @param x2 right coordinate of the rectangle
 * @param y1 top coordinate of the rectangle
 * @param y2 bottom coordinate of the rectangle
 * @param color_p pointer to an array of colors
 */
static void LCD_Flush(lv_disp_drv_t * drv, const lv_area_t * area, lv_color_t * color_p)
{
	/*Truncate the area to the screen*/
	int32_t act_x1 = area->x1 < 0 ? 0 : area->x1;
	int32_t act_y1 = area->y1 < 0 ? 0 : area->y1;
	int32_t act_x2 = area->x2 > LV_HOR_RES_MAX - 1 ? LV_HOR_RES_MAX - 1 : area->x2;
	int32_t act_y2 = area->y2 > LV_VER_RES_MAX - 1 ? LV_VER_RES_MAX - 1 : area->y2;

	//ILI9341_Set_Address(act_x1,act_y1,act_x2,act_y2);
#if !USE_DMA
	//Without DMA
	//ILI9341_DrawImage(act_x1, act_y1, (act_x2 - act_x1 + 1), (act_y2 - act_y1 + 1), color_p);
	HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
	ILI9341_SetAddressWindow(act_x1,act_y1,act_x2,act_y2);
    ILI9341_WriteData((uint8_t*)color_p, sizeof(uint16_t)*((act_x2 - act_x1 + 1) * (act_y2 - act_y1 + 1)));
    HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);

   	/*int32_t x, y;
   	for(y = act_y1; y <= act_y2; y++) {
   		for(x = act_x1; x <= act_x2; x++) {
   			//ILI9341_Draw_Pixel(x,y, color_p->full);
   			ILI9341_Write_Data(color_p->full>>8);
   			ILI9341_Write_Data(color_p->full);
       		color_p+=1;
       	}
    }*/

   	lv_disp_flush_ready(&disp_drv);
#else

   	#if USE_DMA_IRQ

   	//Using DMA with IRQ
   	if(HAL_DMA_Start_IT (&hdma_memtomem_dma2_stream0,
   						(uint32_t)color_p,
						(uint32_t)LCD_BASE1,
						(act_x2 - act_x1 + 1) * (act_y2 - act_y1 + 1))
   						== HAL_OK){
    } else {
    	while(1); //in case of error
    }
    /* lv_disp_flush_ready(&disp_drv) is located in DMA_TransferComplete() callback */

   	#else

   	//Using DMA without IRQ
   	if(HAL_DMA_Start	(&hdma_memtomem_dma2_stream0,
   						(uint32_t)color_p,
						(uint32_t)LCD_BASE1,
						(act_x2 - act_x1 + 1) * (act_y2 - act_y1 + 1))
   						== HAL_OK){
    	HAL_DMA_PollForTransfer(&hdma_memtomem_dma2_stream0, HAL_DMA_FULL_TRANSFER, 1000);
    	lv_disp_flush_ready(&disp_drv);
    } else {
    	while(1); //in case of error
    }

   	#endif
#endif
}


//DMA Interrupt Transfer complete callback
static void DMA_TransferComplete(DMA_HandleTypeDef *han) {
	//HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_6); //toggle LED on interrupt
	lv_disp_flush_ready(&disp_drv);
}






/* ----------------TOUCHPAD --------------------*/
void lv_encoder_init(void)
{

	lv_indev_drv_t indev_drv;
	lv_indev_drv_init(&indev_drv);
  indev_drv.type = LV_INDEV_TYPE_ENCODER;
  indev_drv.read_cb = encoder_read;
  indev_encoder = lv_indev_drv_register(&indev_drv);
  //lv_indev_drv_register(&indev_drv);

  /*
  lv_indev_drv_t indev_drv;
  lv_indev_drv_init(&indev_drv);
  indev_drv.read_cb = touchpad_read;
  indev_drv.type = LV_INDEV_TYPE_POINTER;
  lv_indev_drv_register(&indev_drv);
  */

}

/**
 * Read an input device
 * @param indev_id id of the input device to read
 * @param x put the x coordinate here
 * @param y put the y coordinate here
 * @return true: the device is pressed, false: released
 */

/* Will be called by the library to read the encoder */

bool encoder_read(lv_indev_drv_t * indev, lv_indev_data_t * data)
{

	if (encBtnFlag == 1) {
		data->state = LV_INDEV_STATE_PR;
	} 	else	{
		data->state = LV_INDEV_STATE_REL;
	}


	if(encoderStep>0){
		data->enc_diff = 1;
		HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_2);
	} else if (encoderStep<0) {
		data->enc_diff = -1;
		HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_2);
	} else {
		data->enc_diff = 0;
	}

	encoderStep = 0;

	return false;
}






