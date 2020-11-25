- this is not for no paired .c and .h 

- add this to main.c
#include "ILI9341/ILI9341_STM32_Driver.h"
//#include "ILI9341/testimg1.h"
//#include "ILI9341/testimg2.h"

extern uint16_t FCOLOR;
extern uint16_t BCOLOR;
extern uint16_t FONTNR;


-------------------------------------------------------------
main.c code samples
-------------------------------------------------------------

//loging screen

 sprintf((char*)buff, "timeCnt:%i\n", timeCnt );
 //CDC_Transmit_FS((uint8_t*)buff, strlen((char*)buff));
 ILI9341_LogToLCD(buff);




ILI9341_Fill_Screen(BLACK);
ILI9341_Set_Rotation(SCREEN_HORIZONTAL_2);

//font fixed
ILI9341_WriteString(0, 0, "Font_7x10, red on black, lorem ipsum dolor sit amet", Font_7x10, RED, BLACK);
ILI9341_WriteString(0, 3*10, "Font_11x18, green, lorem ipsum dolor sit amet", Font_11x18, GREEN, BLACK);
ILI9341_WriteString(0, 3*10+3*18, "Font_16x26, blue, lorem ipsum dolor sit amet", Font_16x26, BLUE, BLACK);

//font sizable
ILI9341_Draw_Text("Font sizable", 10, 10, GREEN, 1, BLACK);
ILI9341_Draw_Text("Font sizable", 10, 10, GREEN, 2, BLACK);
ILI9341_Draw_Text("Font sizable", 10, 10, GREEN, 3, BLACK);



//some shapes
ILI9341_Set_Rotation(SCREEN_HORIZONTAL_2);
ILI9341_Draw_Text("Rectangle alignment check", 10, 10, BLACK, 1, WHITE);
ILI9341_Fill_Screen(WHITE);

ILI9341_Draw_Hollow_Rectangle_Coord(50, 50, 100, 100, BLACK);
ILI9341_Draw_Filled_Rectangle_Coord(20, 20, 50, 50, BLACK);
ILI9341_Draw_Hollow_Rectangle_Coord(10, 10, 19, 19, BLACK);

//pixel
ILI9341_Draw_Pixel(x, y, GREEN);


//----------------------------------------------------------565 COLOUR EXAMPLE, Grayscale
ILI9341_Fill_Screen(WHITE);
ILI9341_Set_Rotation(SCREEN_HORIZONTAL_2);
ILI9341_Draw_Text("Colour gradient", 10, 10, BLACK, 1, WHITE);
ILI9341_Draw_Text("Grayscale", 10, 20, BLACK, 1, WHITE);
HAL_Delay(2000);


for(uint16_t i = 0; i <= (320); i++)
{
	uint16_t Red = 0;
	uint16_t Green = 0;
	uint16_t Blue = 0;

	Red = i/(10);
	Red <<= 11;
	Green = i/(5);
	Green <<= 5;
	Blue = i/(10);



	uint16_t RGB_color = Red + Green + Blue;
	ILI9341_Draw_Rectangle(i, x, 1, 240, RGB_color);

}













IMAGES:

ILI9341_Draw_Image(128,128,(const char*)cats, SCREEN_VERTICAL_1); HAL_Delay(1000);
ILI9341_Draw_Image(128,128,(const char*)cats, SCREEN_VERTICAL_2); HAL_Delay(1000);
ILI9341_Draw_Image(128,128,(const char*)cats, SCREEN_HORIZONTAL_1); HAL_Delay(1000);
ILI9341_Draw_Image(128,128,(const char*)cats, SCREEN_HORIZONTAL_2); HAL_Delay(1000);*/


ILI9341_Fill_Screen(BLACK);
ILI9341_Set_Rotation(SCREEN_VERTICAL_1);
ILI9341_DrawImage(1, 1, 128, 128, (const uint16_t*)image_data_cats); HAL_Delay(100);
ILI9341_Set_Rotation(SCREEN_VERTICAL_2);
ILI9341_DrawImage(1, 1, 128, 128, (const uint16_t*)image_data_cats); HAL_Delay(100);
ILI9341_Set_Rotation(SCREEN_HORIZONTAL_1);
ILI9341_DrawImage(1, 1, 128, 128, (const uint16_t*)image_data_cats); HAL_Delay(100);
ILI9341_Set_Rotation(SCREEN_HORIZONTAL_2);
ILI9341_DrawImage(1, 1, 128, 128, (const uint16_t*)image_data_cats); HAL_Delay(100);
HAL_Delay(1000);


