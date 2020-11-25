
//	MIT License
//
//	Copyright (c) 2017 Matej Artnak
//
//	ILI9341 Driver library for STM32
//-----------------------------------
//
//	While there are other libraries for ILI9341 they mostly require either interrupts, DMA or both for fast drawing
//	The intent of this library is to offer a simple yet still reasonably fast alternatives for those that
//	do not wish to use interrupts or DMA in their projects.
//
//	Library is written for STM32 HAL library and supports STM32CUBEMX. To use the library with Cube software
//	you need to tick the box that generates peripheral initialization code in their own respective .c and .h file
//
//
//-----------------------------------
//	Performance
//-----------------------------------
//	Settings:	
//	--SPI @ 50MHz 
//	--STM32F746ZG Nucleo board
//	--Redraw entire screen
//
//	++		Theoretical maximum FPS with 50Mhz SPI calculated to be 40.69 FPS
//	++		320*240 = 76800 pixels, each pixel contains 16bit colour information (2x8)
//	++		Theoretical Max FPS: 1/((320*240*16)/50000000)
//
//
//
/* JK Display Connection
 * Display wiki: http://www.lcdwiki.com/2.2inch_SPI_Module_ILI9341_SKU:MSP2202
 * Display				BluePill
 * 1) VCC				3.3V~5V
 * 2) GND				GND
 * 3) CS				PB3
 * 4) RESET				PB5
 * 5) DC/RS				PB4
 * 6) SDI/MOSI			PA7	(SPI1_MOSI)
 * 7) SCK				PA5	(SPI1_SCK)
 * 8) LED				PA8
 * 9) SDO/MISO			PA6	(SPI1_MISO)
 *
 *
 */


//-----------------------------------

/* Includes ------------------------------------------------------------------*/

#include <ILI9341.h>
#include "stm32f1xx_hal.h"
#include "main.h"
//#include "spi.h"
//#include "gpio.h"
#include <stdio.h>
#include <string.h>
#ifndef MINIMUM_MEMORY
#include "fonts.h"
#endif



/* Global Variables ------------------------------------------------------------------*/
volatile uint16_t LCD_HEIGHT = ILI9341_SCREEN_HEIGHT;
volatile uint16_t LCD_WIDTH	 = ILI9341_SCREEN_WIDTH;

volatile uint16_t ILI9341_Log_FCOLOR = WHITE;
volatile uint16_t ILI9341_Log_BCOLOR = ASSEMBLE_RGB(30,30,50);
volatile uint16_t ILI9341_Log_FONTNR = 0; //0-2

volatile uint16_t ILI9341_Log_Width = LCD_LOG_WIDTH;
volatile uint16_t ILI9341_Log_Height = LCD_LOG_HEIGHT;

volatile uint16_t ILI9341_Log_Posx = (ILI9341_SCREEN_WIDTH - LCD_LOG_WIDTH)/2;
volatile uint16_t ILI9341_Log_Posy = (ILI9341_SCREEN_HEIGHT-LCD_LOG_HEIGHT)/2;





static void ILI9341_Select() {
    HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
}

static void ILI9341_Unselect() {
    HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);
}


/* Initialize SPI */
void ILI9341_SPI_Init(void)
{
//MX_SPI1_Init();	//Run from main
//MX_GPIO_Init();	//Run from main

HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);	//CS OFF
}

/*Send data (char) to LCD*/
void ILI9341_SPI_Send(unsigned char SPI_Data)
{
HAL_SPI_Transmit(HSPI_INSTANCE, &SPI_Data, 1, 1);
}

/* Send command (char) to LCD */
void ILI9341_Write_Command(uint8_t Command)
{
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_RESET);	
ILI9341_SPI_Send(Command);
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);		
}

/* Send Data (char) to LCD */
void ILI9341_Write_Data(uint8_t Data)
{
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
ILI9341_SPI_Send(Data);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);
}

/* Set Address - Location block - to draw into */
void ILI9341_Set_Address(uint16_t X1, uint16_t Y1, uint16_t X2, uint16_t Y2)
{
ILI9341_Write_Command(0x2A);
ILI9341_Write_Data(X1>>8);
ILI9341_Write_Data(X1);
ILI9341_Write_Data(X2>>8);
ILI9341_Write_Data(X2);

ILI9341_Write_Command(0x2B);
ILI9341_Write_Data(Y1>>8);
ILI9341_Write_Data(Y1);
ILI9341_Write_Data(Y2>>8);
ILI9341_Write_Data(Y2);

ILI9341_Write_Command(0x2C);
}

/*HARDWARE RESET*/
void ILI9341_Reset(void)
{
HAL_GPIO_WritePin(LCD_RST_PORT, LCD_RST_PIN, GPIO_PIN_RESET);
HAL_Delay(200);
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
HAL_Delay(200);
HAL_GPIO_WritePin(LCD_RST_PORT, LCD_RST_PIN, GPIO_PIN_SET);	
}

/*Ser rotation of the screen - changes x0 and y0*/
void ILI9341_Set_Rotation(uint8_t Rotation) 
{
	
uint8_t screen_rotation = Rotation;

ILI9341_Write_Command(0x36);
HAL_Delay(1);
	
switch(screen_rotation) 
	{
		case SCREEN_VERTICAL_1:
			ILI9341_Write_Data(0x40|0x08);
			LCD_WIDTH = 240;
			LCD_HEIGHT = 320;
			break;
		case SCREEN_HORIZONTAL_1:
			ILI9341_Write_Data(0x20|0x08);
			LCD_WIDTH  = 320;
			LCD_HEIGHT = 240;
			break;
		case SCREEN_VERTICAL_2:
			ILI9341_Write_Data(0x80|0x08);
			LCD_WIDTH  = 240;
			LCD_HEIGHT = 320;
			break;
		case SCREEN_HORIZONTAL_2:
			ILI9341_Write_Data(0x40|0x80|0x20|0x08);
			LCD_WIDTH  = 320;
			LCD_HEIGHT = 240;
			break;
		default:
			//EXIT IF SCREEN ROTATION NOT VALID!
			break;
	}
}

/*Enable LCD display*/
void ILI9341_Enable(void)
{
HAL_GPIO_WritePin(LCD_RST_PORT, LCD_RST_PIN, GPIO_PIN_SET);
}

/*Initialize LCD display*/
void ILI9341_Init(void)
{

ILI9341_Enable();
ILI9341_SPI_Init();
ILI9341_Reset();

//SOFTWARE RESET
ILI9341_Write_Command(0x01);
HAL_Delay(1000);
	
//POWER CONTROL A
ILI9341_Write_Command(0xCB);
ILI9341_Write_Data(0x39);
ILI9341_Write_Data(0x2C);
ILI9341_Write_Data(0x00);
ILI9341_Write_Data(0x34);
ILI9341_Write_Data(0x02);

//POWER CONTROL B
ILI9341_Write_Command(0xCF);
ILI9341_Write_Data(0x00);
ILI9341_Write_Data(0xC1);
ILI9341_Write_Data(0x30);

//DRIVER TIMING CONTROL A
ILI9341_Write_Command(0xE8);
ILI9341_Write_Data(0x85);
ILI9341_Write_Data(0x00);
ILI9341_Write_Data(0x78);

//DRIVER TIMING CONTROL B
ILI9341_Write_Command(0xEA);
ILI9341_Write_Data(0x00);
ILI9341_Write_Data(0x00);

//POWER ON SEQUENCE CONTROL
ILI9341_Write_Command(0xED);
ILI9341_Write_Data(0x64);
ILI9341_Write_Data(0x03);
ILI9341_Write_Data(0x12);
ILI9341_Write_Data(0x81);

//PUMP RATIO CONTROL
ILI9341_Write_Command(0xF7);
ILI9341_Write_Data(0x20);

//POWER CONTROL,VRH[5:0]
ILI9341_Write_Command(0xC0);
ILI9341_Write_Data(0x23);

//POWER CONTROL,SAP[2:0];BT[3:0]
ILI9341_Write_Command(0xC1);
ILI9341_Write_Data(0x10);

//VCM CONTROL
ILI9341_Write_Command(0xC5);
ILI9341_Write_Data(0x3E);
ILI9341_Write_Data(0x28);

//VCM CONTROL 2
ILI9341_Write_Command(0xC7);
ILI9341_Write_Data(0x86);

//MEMORY ACCESS CONTROL
ILI9341_Write_Command(0x36);
ILI9341_Write_Data(0x48);

//PIXEL FORMAT
ILI9341_Write_Command(0x3A);
ILI9341_Write_Data(0x55);

//FRAME RATIO CONTROL, STANDARD RGB COLOR
ILI9341_Write_Command(0xB1);
ILI9341_Write_Data(0x00);
ILI9341_Write_Data(0x18);

//DISPLAY FUNCTION CONTROL
ILI9341_Write_Command(0xB6);
ILI9341_Write_Data(0x08);
ILI9341_Write_Data(0x82);
ILI9341_Write_Data(0x27);

//3GAMMA FUNCTION DISABLE
ILI9341_Write_Command(0xF2);
ILI9341_Write_Data(0x00);

//GAMMA CURVE SELECTED
ILI9341_Write_Command(0x26);
ILI9341_Write_Data(0x01);

//POSITIVE GAMMA CORRECTION
ILI9341_Write_Command(0xE0);
ILI9341_Write_Data(0x0F);
ILI9341_Write_Data(0x31);
ILI9341_Write_Data(0x2B);
ILI9341_Write_Data(0x0C);
ILI9341_Write_Data(0x0E);
ILI9341_Write_Data(0x08);
ILI9341_Write_Data(0x4E);
ILI9341_Write_Data(0xF1);
ILI9341_Write_Data(0x37);
ILI9341_Write_Data(0x07);
ILI9341_Write_Data(0x10);
ILI9341_Write_Data(0x03);
ILI9341_Write_Data(0x0E);
ILI9341_Write_Data(0x09);
ILI9341_Write_Data(0x00);

//NEGATIVE GAMMA CORRECTION
ILI9341_Write_Command(0xE1);
ILI9341_Write_Data(0x00);
ILI9341_Write_Data(0x0E);
ILI9341_Write_Data(0x14);
ILI9341_Write_Data(0x03);
ILI9341_Write_Data(0x11);
ILI9341_Write_Data(0x07);
ILI9341_Write_Data(0x31);
ILI9341_Write_Data(0xC1);
ILI9341_Write_Data(0x48);
ILI9341_Write_Data(0x08);
ILI9341_Write_Data(0x0F);
ILI9341_Write_Data(0x0C);
ILI9341_Write_Data(0x31);
ILI9341_Write_Data(0x36);
ILI9341_Write_Data(0x0F);

//EXIT SLEEP
ILI9341_Write_Command(0x11);
HAL_Delay(120);

//TURN ON DISPLAY
ILI9341_Write_Command(0x29);

//STARTING ROTATION
ILI9341_Set_Rotation(SCREEN_VERTICAL_1);
}

//INTERNAL FUNCTION OF LIBRARY, USAGE NOT RECOMENDED, USE Draw_Pixel INSTEAD
/*Sends single pixel colour information to LCD*/
void ILI9341_Draw_Colour(uint16_t Colour)
{
//SENDS COLOUR
unsigned char TempBuffer[2] = {Colour>>8, Colour};	
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
HAL_SPI_Transmit(HSPI_INSTANCE, TempBuffer, 2, 1);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);
}

//INTERNAL FUNCTION OF LIBRARY
/*Sends block colour information to LCD*/
void ILI9341_Draw_Colour_Burst(uint16_t Colour, uint32_t Size)
{
//SENDS COLOUR
uint32_t Buffer_Size = 0;
if((Size*2) < BURST_MAX_SIZE)
{
	Buffer_Size = Size;
}
else
{
	Buffer_Size = BURST_MAX_SIZE;
}
	
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);

unsigned char chifted = 	Colour>>8;;
unsigned char burst_buffer[Buffer_Size];
for(uint32_t j = 0; j < Buffer_Size; j+=2)
	{
		burst_buffer[j] = 	chifted;
		burst_buffer[j+1] = Colour;
	}

uint32_t Sending_Size = Size*2;
uint32_t Sending_in_Block = Sending_Size/Buffer_Size;
uint32_t Remainder_from_block = Sending_Size%Buffer_Size;

if(Sending_in_Block != 0)
{
	for(uint32_t j = 0; j < (Sending_in_Block); j++)
		{
		HAL_SPI_Transmit(HSPI_INSTANCE, (unsigned char *)burst_buffer, Buffer_Size, 10);	
		}
}

//REMAINDER!
HAL_SPI_Transmit(HSPI_INSTANCE, (unsigned char *)burst_buffer, Remainder_from_block, 10);	
	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);
}

//FILL THE ENTIRE SCREEN WITH SELECTED COLOUR (either #define-d ones or custom 16bit)
/*Sets address (entire screen) and Sends Height*Width ammount of colour information to LCD*/
void ILI9341_Fill_Screen(uint16_t Colour)
{
ILI9341_Set_Address(0,0,LCD_WIDTH,LCD_HEIGHT);	
ILI9341_Draw_Colour_Burst(Colour, LCD_WIDTH*LCD_HEIGHT);	
}

//DRAW PIXEL AT XY POSITION WITH SELECTED COLOUR
//
//Location is dependant on screen orientation. x0 and y0 locations change with orientations.
//Using pixels to draw big simple structures is not recommended as it is really slow
//Try using either rectangles or lines if possible
//
void ILI9341_Draw_Pixel(uint16_t X,uint16_t Y,uint16_t Colour) 
{
if((X >=LCD_WIDTH) || (Y >=LCD_HEIGHT)) return;	//OUT OF BOUNDS!
	
//ADDRESS
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_RESET);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
ILI9341_SPI_Send(0x2A);
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);		

//XDATA
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);	
unsigned char Temp_Buffer[4] = {X>>8,X, (X+1)>>8, (X+1)};
HAL_SPI_Transmit(HSPI_INSTANCE, Temp_Buffer, 4, 1);
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);

//ADDRESS
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_RESET);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);	
ILI9341_SPI_Send(0x2B);
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);			
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);			

//YDATA
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
unsigned char Temp_Buffer1[4] = {Y>>8,Y, (Y+1)>>8, (Y+1)};
HAL_SPI_Transmit(HSPI_INSTANCE, Temp_Buffer1, 4, 1);
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);

//ADDRESS	
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_RESET);	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);	
ILI9341_SPI_Send(0x2C);
HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);			
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);			

//COLOUR	
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
unsigned char Temp_Buffer2[2] = {Colour>>8, Colour};
HAL_SPI_Transmit(HSPI_INSTANCE, Temp_Buffer2, 2, 1);
HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);
	
}

//DRAW RECTANGLE OF SET SIZE AND HEIGTH AT X and Y POSITION WITH CUSTOM COLOUR
//
//Rectangle is hollow. X and Y positions mark the upper left corner of rectangle
//As with all other draw calls x0 and y0 locations dependant on screen orientation
//

static void ILI9341_WriteCommand(uint8_t cmd) {
    HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_RESET);
    HAL_SPI_Transmit(HSPI_INSTANCE, &cmd, sizeof(cmd), HAL_MAX_DELAY);
}

void ILI9341_SetAddressWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1) {
    // column address set
    ILI9341_WriteCommand(0x2A); // CASET
    {
        uint8_t data[] = { (x0 >> 8) & 0xFF, x0 & 0xFF, (x1 >> 8) & 0xFF, x1 & 0xFF };
        ILI9341_WriteData(data, sizeof(data));
    }

    // row address set
    ILI9341_WriteCommand(0x2B); // RASET
    {
        uint8_t data[] = { (y0 >> 8) & 0xFF, y0 & 0xFF, (y1 >> 8) & 0xFF, y1 & 0xFF };
        ILI9341_WriteData(data, sizeof(data));
    }

    // write to RAM
    ILI9341_WriteCommand(0x2C); // RAMWR
}



void ILI9341_WriteData(uint8_t* buff, size_t buff_size) {
    HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);

    // split data in small chunks because HAL can't send more then 64K at once
    while(buff_size > 0) {
        uint16_t chunk_size = buff_size > 32768 ? 32768 : buff_size;
        HAL_SPI_Transmit(HSPI_INSTANCE, buff, chunk_size, HAL_MAX_DELAY);
        buff += chunk_size;
        buff_size -= chunk_size;
    }
}

/*void ILI9341_DrawImage(uint16_t x, uint16_t y, uint16_t w, uint16_t h, const uint16_t* data)*/
void ILI9341_DrawImage(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t* data) {
    if((x >= LCD_WIDTH) || (y >= LCD_HEIGHT)) return;
    if((x + w - 1) >= LCD_WIDTH) return;
    if((y + h - 1) >= LCD_HEIGHT) return;

    ILI9341_Select();
    ILI9341_SetAddressWindow(x, y, x+w-1, y+h-1);
    ILI9341_WriteData((uint8_t*)data, sizeof(uint16_t)*w*h);
    ILI9341_Unselect();
}

void ILI9341_Draw_Image(uint16_t x, uint16_t y,  uint16_t width, uint16_t height,const char* Image_Array, uint8_t Orientation)
{


	if(Orientation == SCREEN_HORIZONTAL_1)
	{
		ILI9341_Set_Rotation(SCREEN_HORIZONTAL_1);
	}
	else if(Orientation == SCREEN_HORIZONTAL_2)
	{
		ILI9341_Set_Rotation(SCREEN_HORIZONTAL_2);
	}
	else if(Orientation == SCREEN_VERTICAL_1)
	{
		ILI9341_Set_Rotation(SCREEN_VERTICAL_1);
	}
	else if(Orientation == SCREEN_VERTICAL_2)
	{
		ILI9341_Set_Rotation(SCREEN_VERTICAL_2);
	}

		//ILI9341_Set_Address(1,1,width,height);
		ILI9341_SetAddressWindow(x, y, x+width-1, y+height-1);

		HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);
		HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);

		unsigned char Temp_small_buffer[BURST_MAX_SIZE];
		uint32_t counter = 0;
		for(uint32_t i = 0; i < width*height*2/BURST_MAX_SIZE; i++)
		{
				for(uint32_t k = 0; k< BURST_MAX_SIZE; k++)
				{
					Temp_small_buffer[k]	= Image_Array[counter+k];
				}
				HAL_SPI_Transmit(&hspi1, (unsigned char*)Temp_small_buffer, BURST_MAX_SIZE, 10);
				counter += BURST_MAX_SIZE;
		}
		HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);



}

#ifndef MINIMUM_MEMORY

void ILI9341_Draw_Image(uint16_t width, uint16_t height,const char* Image_Array, uint8_t Orientation)
{


	if(Orientation == SCREEN_HORIZONTAL_1)
	{
		ILI9341_Set_Rotation(SCREEN_HORIZONTAL_1);
	}
	else if(Orientation == SCREEN_HORIZONTAL_2)
	{
		ILI9341_Set_Rotation(SCREEN_HORIZONTAL_2);
	}
	else if(Orientation == SCREEN_VERTICAL_1)
	{
		ILI9341_Set_Rotation(SCREEN_VERTICAL_1);
	}
	else if(Orientation == SCREEN_VERTICAL_2)
	{
		ILI9341_Set_Rotation(SCREEN_VERTICAL_2);
	}

		ILI9341_Set_Address(1,1,width,height);

		HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);
		HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);

		unsigned char Temp_small_buffer[BURST_MAX_SIZE];
		uint32_t counter = 0;
		for(uint32_t i = 0; i < width*height*2/BURST_MAX_SIZE; i++)
		{
				for(uint32_t k = 0; k< BURST_MAX_SIZE; k++)
				{
					Temp_small_buffer[k]	= Image_Array[counter+k];
				}
				HAL_SPI_Transmit(&hspi1, (unsigned char*)Temp_small_buffer, BURST_MAX_SIZE, 10);
				counter += BURST_MAX_SIZE;
		}
		HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);



}
void ILI9341_Draw_Rectangle(uint16_t X, uint16_t Y, uint16_t Width, uint16_t Height, uint16_t Colour)
{
if((X >=LCD_WIDTH) || (Y >=LCD_HEIGHT)) return;
if((X+Width-1)>=LCD_WIDTH)
	{
		Width=LCD_WIDTH-X;
	}
if((Y+Height-1)>=LCD_HEIGHT)
	{
		Height=LCD_HEIGHT-Y;
	}
ILI9341_Set_Address(X, Y, X+Width-1, Y+Height-1);
ILI9341_Draw_Colour_Burst(Colour, Height*Width);
}


void ILI9341_Draw_Rectangle_Centered(uint16_t Width, uint16_t Height, uint16_t Colour) {
	ILI9341_Draw_Rectangle((LCD_WIDTH-Width)/2, (LCD_HEIGHT-Height)/2, Width, Height, Colour);
}


void ILI9341_Draw_Hollow_Rectangle(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint16_t Colour)
{
	ILI9341_Draw_Horizontal_Line(x, y, width, Colour); //TOP

	ILI9341_Draw_Vertical_Line(x, y, height, Colour); //LEFT

	ILI9341_Draw_Horizontal_Line(x, y+height, width, Colour); //BOTTOM

	ILI9341_Draw_Vertical_Line(x+width, y, height, Colour); //RIGHT

}

void ILI9341_Draw_Hollow_Rectangle_Centered(uint16_t Width, uint16_t Height, uint16_t Colour)
{
	ILI9341_Draw_Hollow_Rectangle((LCD_WIDTH-Width)/2, (LCD_HEIGHT-Height)/2, Width, Height, Colour);
}



//DRAW LINE FROM X,Y LOCATION to X+Width,Y LOCATION
void ILI9341_Draw_Horizontal_Line(uint16_t X, uint16_t Y, uint16_t Width, uint16_t Colour)
{
if((X >=LCD_WIDTH) || (Y >=LCD_HEIGHT)) return;
if((X+Width-1)>=LCD_WIDTH)
	{
		Width=LCD_WIDTH-X;
	}
//ILI9341_Draw_Rectangle(X, Y, Width, 1, Colour);

ILI9341_Set_Address(X, Y, X+Width-1, Y);
ILI9341_Draw_Colour_Burst(Colour, Width);

}

//DRAW LINE FROM X,Y LOCATION to X,Y+Height LOCATION
void ILI9341_Draw_Vertical_Line(uint16_t X, uint16_t Y, uint16_t Height, uint16_t Colour)
{
if((X >=LCD_WIDTH) || (Y >=LCD_HEIGHT)) return;
if((Y+Height-1)>=LCD_HEIGHT)
	{

	Height=LCD_HEIGHT-Y;
	}
ILI9341_Set_Address(X, Y, X, Y+Height-1);
ILI9341_Draw_Colour_Burst(Colour, Height);
}



/*------------------------------- GFX -----------------------------------------*/

//	MIT License
//
//	Copyright (c) 2017 Matej Artnak
//
//
//-----------------------------------



/*Draw hollow circle at X,Y location with specified radius and colour. X and Y represent circles center */
void ILI9341_Draw_Hollow_Circle(uint16_t X, uint16_t Y, uint16_t Radius, uint16_t Colour)
{
	int x = Radius-1;
    int y = 0;
    int dx = 1;
    int dy = 1;
    int err = dx - (Radius << 1);

    while (x >= y)
    {
        ILI9341_Draw_Pixel(X + x, Y + y, Colour);
        ILI9341_Draw_Pixel(X + y, Y + x, Colour);
        ILI9341_Draw_Pixel(X - y, Y + x, Colour);
        ILI9341_Draw_Pixel(X - x, Y + y, Colour);
        ILI9341_Draw_Pixel(X - x, Y - y, Colour);
        ILI9341_Draw_Pixel(X - y, Y - x, Colour);
        ILI9341_Draw_Pixel(X + y, Y - x, Colour);
        ILI9341_Draw_Pixel(X + x, Y - y, Colour);

        if (err <= 0)
        {
            y++;
            err += dy;
            dy += 2;
        }
        if (err > 0)
        {
            x--;
            dx += 2;
            err += (-Radius << 1) + dx;
        }
    }
}

/*Draw filled circle at X,Y location with specified radius and colour. X and Y represent circles center */
void ILI9341_Draw_Filled_Circle(uint16_t X, uint16_t Y, uint16_t Radius, uint16_t Colour)
{

		int x = Radius;
    int y = 0;
    int xChange = 1 - (Radius << 1);
    int yChange = 0;
    int radiusError = 0;

    while (x >= y)
    {
        for (int i = X - x; i <= X + x; i++)
        {
            ILI9341_Draw_Pixel(i, Y + y,Colour);
            ILI9341_Draw_Pixel(i, Y - y,Colour);
        }
        for (int i = X - y; i <= X + y; i++)
        {
            ILI9341_Draw_Pixel(i, Y + x,Colour);
            ILI9341_Draw_Pixel(i, Y - x,Colour);
        }

        y++;
        radiusError += yChange;
        yChange += 2;
        if (((radiusError << 1) + xChange) > 0)
        {
            x--;
            radiusError += xChange;
            xChange += 2;
        }
    }
		//Really slow implementation, will require future overhaul
		//TODO:	https://stackoverflow.com/questions/1201200/fast-algorithm-for-drawing-filled-circles
}

/*Draw a hollow rectangle between positions X0,Y0 and X1,Y1 with specified colour*/
void ILI9341_Draw_Hollow_Rectangle_Coord(uint16_t X0, uint16_t Y0, uint16_t X1, uint16_t Y1, uint16_t Colour)
{
	uint16_t 	X_length = 0;
	uint16_t 	Y_length = 0;
	uint8_t		Negative_X = 0;
	uint8_t 	Negative_Y = 0;
	float 		Calc_Negative = 0;

	Calc_Negative = X1 - X0;
	if(Calc_Negative < 0) Negative_X = 1;
	Calc_Negative = 0;

	Calc_Negative = Y1 - Y0;
	if(Calc_Negative < 0) Negative_Y = 1;


	//DRAW HORIZONTAL!
	if(!Negative_X)
	{
		X_length = X1 - X0;
	}
	else
	{
		X_length = X0 - X1;
	}
	ILI9341_Draw_Horizontal_Line(X0, Y0, X_length, Colour);
	ILI9341_Draw_Horizontal_Line(X0, Y1, X_length, Colour);



	//DRAW VERTICAL!
	if(!Negative_Y)
	{
		Y_length = Y1 - Y0;
	}
	else
	{
		Y_length = Y0 - Y1;
	}
	ILI9341_Draw_Vertical_Line(X0, Y0, Y_length, Colour);
	ILI9341_Draw_Vertical_Line(X1, Y0, Y_length, Colour);

	if((X_length > 0)||(Y_length > 0))
	{
		ILI9341_Draw_Pixel(X1, Y1, Colour);
	}

}

/*Draw a filled rectangle between positions X0,Y0 and X1,Y1 with specified colour*/
void ILI9341_Draw_Filled_Rectangle_Coord(uint16_t X0, uint16_t Y0, uint16_t X1, uint16_t Y1, uint16_t Colour)
{
	uint16_t 	X_length = 0;
	uint16_t 	Y_length = 0;
	uint8_t		Negative_X = 0;
	uint8_t 	Negative_Y = 0;
	int32_t 	Calc_Negative = 0;

	uint16_t X0_true = 0;
	uint16_t Y0_true = 0;

	Calc_Negative = X1 - X0;
	if(Calc_Negative < 0) Negative_X = 1;
	Calc_Negative = 0;

	Calc_Negative = Y1 - Y0;
	if(Calc_Negative < 0) Negative_Y = 1;


	//DRAW HORIZONTAL!
	if(!Negative_X)
	{
		X_length = X1 - X0;
		X0_true = X0;
	}
	else
	{
		X_length = X0 - X1;
		X0_true = X1;
	}

	//DRAW VERTICAL!
	if(!Negative_Y)
	{
		Y_length = Y1 - Y0;
		Y0_true = Y0;
	}
	else
	{
		Y_length = Y0 - Y1;
		Y0_true = Y1;
	}

	ILI9341_Draw_Rectangle(X0_true, Y0_true, X_length, Y_length, Colour);
}

/*Draws a character (fonts imported from fonts.h) at X,Y location with specified font colour, size and Background colour*/
/*See fonts.h implementation of font on what is required for changing to a different font when switching fonts libraries*/



void ILI9341_Draw_Char(char Character, uint8_t X, uint8_t Y, uint16_t Colour, uint16_t Size, uint16_t Background_Colour)
{
		uint8_t 	function_char;
    uint8_t 	i,j;

		function_char = Character;

    if (function_char < ' ') {
        Character = 0;
    } else {
        function_char -= 32;
		}

		char temp[CHAR_WIDTH];
		for(uint8_t k = 0; k<CHAR_WIDTH; k++)
		{
		temp[k] = font[function_char][k];
		}

    // Draw pixels
		ILI9341_Draw_Rectangle(X, Y, CHAR_WIDTH*Size, CHAR_HEIGHT*Size, Background_Colour);
    for (j=0; j<CHAR_WIDTH; j++) {
        for (i=0; i<CHAR_HEIGHT; i++) {
            if (temp[j] & (1<<i)) {
							if(Size == 1)
							{
              ILI9341_Draw_Pixel(X+j, Y+i, Colour);
							}
							else
							{
							ILI9341_Draw_Rectangle(X+(j*Size), Y+(i*Size), Size, Size, Colour);
							}
            }
        }
    }
}

/*Draws an array of characters (fonts imported from fonts.h) at X,Y location with specified font colour, size and Background colour*/
/*See fonts.h implementation of font on what is required for changing to a different font when switching fonts libraries*/
void ILI9341_Draw_Text(const char* Text, uint8_t X, uint8_t Y, uint16_t Colour, uint16_t Size, uint16_t Background_Colour)
{
    while (*Text) {
        ILI9341_Draw_Char(*Text++, X, Y, Colour, Size, Background_Colour);
        X += CHAR_WIDTH*Size;
    }
}

/*Draws a full screen picture from flash. Image converted from RGB .jpeg/other to C array using online converter*/
//USING CONVERTER: http://www.digole.com/tools/PicturetoC_Hex_converter.php
//65K colour (2Bytes / Pixel)
#endif

/*--------------------------------------AFISKON----------------------------------------------*/

#ifndef MINIMUM_MEMORY

void ILI9341_WriteChar(uint16_t x, uint16_t y, char ch, FontDef font, uint16_t color, uint16_t bgcolor) {
    uint32_t i, b, j;

    ILI9341_SetAddressWindow(x, y, x+font.width-1, y+font.height-1);

    for(i = 0; i < font.height; i++) {
        b = font.data[(ch - 32) * font.height + i];
        for(j = 0; j < font.width; j++) {
            if((b << j) & 0x8000)  {
                uint8_t data[] = { color >> 8, color & 0xFF };
                ILI9341_WriteData(data, sizeof(data));
            } else {
                uint8_t data[] = { bgcolor >> 8, bgcolor & 0xFF };
                ILI9341_WriteData(data, sizeof(data));
            }
        }
    }
}

void ILI9341_WriteString(uint16_t x, uint16_t y, const char* str, FontDef font, uint16_t color, uint16_t bgcolor) {
    ILI9341_Select();

    while(*str) {
        if(x + font.width >= LCD_WIDTH) {
            x = 0;
            y += font.height;
            if(y + font.height >= LCD_HEIGHT) {
                break;
            }

            if(*str == ' ') {
                // skip spaces in the beginning of the new line
                str++;
                continue;
            }
        }

        ILI9341_WriteChar(x, y, *str, font, color, bgcolor);
        x += font.width;
        str++;
    }

    ILI9341_Unselect();
}

void ILI9341_DrawImage(uint16_t x, uint16_t y, uint16_t w, uint16_t h, const uint16_t* data) {
    if((x >= LCD_WIDTH) || (y >= LCD_HEIGHT)) return;
    if((x + w - 1) >= LCD_WIDTH) return;
    if((y + h - 1) >= LCD_HEIGHT) return;

    ILI9341_Select();
    ILI9341_SetAddressWindow(x, y, x+w-1, y+h-1);
    ILI9341_WriteData((uint8_t*)data, sizeof(uint16_t)*w*h);
    ILI9341_Unselect();
}

void ILI9341_InvertColors(bool invert) {
    ILI9341_Select();
    ILI9341_WriteCommand(invert ? 0x21 /* INVON */ : 0x20 /* INVOFF */);
    ILI9341_Unselect();
}


void ILI9341_LogToLCD(char* buff ) {

	static uint16_t xindex = 0;//ILI9341_Log_Posx
	static uint16_t yindex = 0;//ILI9341_Log_Posy;
	//FontDef fonts[] = {Font_7x10,Font_11x18, Font_16x26};
	FontDef fonts[] = {Font_7x10,Font_11x18};
	uint16_t i = 0;
	//ILI9341_Draw_Hollow_Rectangle_Coord(ILI9341_Log_Posx-5, ILI9341_Log_Posy-5, ILI9341_Log_Width+5, ILI9341_Log_Height+5, YELLOW);
	//ILI9341_Draw_Rectangle(ILI9341_Log_Posx-5, ILI9341_Log_Posy-5, ILI9341_Log_Width+5, ILI9341_Log_Height+5, RED);
	//ILI9341_Draw_Horizontal_Line(ILI9341_Log_Posx-5, ILI9341_Log_Posy-5, ILI9341_Log_Width+5, RED);
	//ILI9341_Draw_Vertical_Line(ILI9341_Log_Posx-5, ILI9341_Log_Posy-5, ILI9341_Log_Height+5, RED);
	//uint16_t LCDWIDTH = LCD_WIDTH;
	//uint16_t LCDHEIGHT = LCD_HEIGHT;

	bool specCharFlag = 0;

	while(*buff) {

		if(buff[i] == '\r' || buff[i] == '\n') {
			specCharFlag = 1;
		}


		if( (xindex > ((ILI9341_Log_Width/fonts[ILI9341_Log_FONTNR].width) -1   )) || specCharFlag == 1) {
			xindex=0;
			if(yindex >= (((ILI9341_Log_Height)/fonts[ILI9341_Log_FONTNR].height) -1  )) {
				yindex = 0;
			} else {
				yindex++;
			}
			ILI9341_Draw_Rectangle(xindex + ILI9341_Log_Posx, (yindex*fonts[ILI9341_Log_FONTNR].height) + ILI9341_Log_Posy, ILI9341_Log_Width, fonts[ILI9341_Log_FONTNR].height, ILI9341_Log_BCOLOR);
		}


		if(!specCharFlag) {

			ILI9341_Select();
			ILI9341_WriteChar(xindex*fonts[ILI9341_Log_FONTNR].width + ILI9341_Log_Posx, (yindex*fonts[ILI9341_Log_FONTNR].height) + ILI9341_Log_Posy , *buff, fonts[ILI9341_Log_FONTNR], ILI9341_Log_FCOLOR, ILI9341_Log_BCOLOR);
			ILI9341_Unselect();
			specCharFlag = 0;
			xindex++;
		}

		buff++;
	}

}


/* puvodniiii


 		if( (xindex > ((LCD_WIDTH/fonts[FONTNR].width)-1)) || specCharFlag == 1) {
			xindex=0;
			yindex++;
			ILI9341_Draw_Rectangle(xindex, yindex*fonts[FONTNR].height, LCD_WIDTH, fonts[FONTNR].height, BCOLOR);
		}

		if(yindex>(((LCD_HEIGHT)/fonts[FONTNR].height)-1)) {
			yindex = 0;
			ILI9341_Draw_Rectangle(xindex, yindex*fonts[FONTNR].height, LCD_WIDTH, fonts[FONTNR].height, BCOLOR); //zbytecne podruhy
		}

		if(!specCharFlag) {
			ILI9341_WriteChar(xindex*fonts[FONTNR].width, yindex*fonts[FONTNR].height, *buff, fonts[FONTNR], FCOLOR, BCOLOR);
			specCharFlag = 0;
			xindex++;
		}



 */

void ILI9341_Log_SetColors(uint16_t fcolor,uint16_t bcolor){
	ILI9341_Log_FCOLOR=fcolor;
	ILI9341_Log_BCOLOR=bcolor;
}

void ILI9341_Log_SetFColor(uint16_t fcolor){
	ILI9341_Log_FCOLOR=fcolor;
}

void ILI9341_Log_SetBColor(uint16_t bcolor){
	ILI9341_Log_BCOLOR=bcolor;
}

void ILI9341_Log_SetFontNr(uint8_t fontnr){
	ILI9341_Log_FONTNR=fontnr;
}


void ILI9341_Log_Init(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint16_t bcolor, uint16_t fcolor, uint8_t fontnr){

	//Vychazet z okraje a modulo urcit sirku a vysku

	ILI9341_Log_FONTNR=fontnr;
	ILI9341_Log_FCOLOR=fcolor;
	ILI9341_Log_BCOLOR=bcolor;
	ILI9341_Log_Posx = x+5;
	ILI9341_Log_Posy = y+5;

	if((x+width)>LCD_WIDTH) {
		width = width - (((x+width)-LCD_WIDTH));
	}
	ILI9341_Log_Width = width;
	ILI9341_Log_Width-=10;

	if((y+height)>LCD_HEIGHT) {
		height = height - ((y+height)-LCD_HEIGHT);
	}
	ILI9341_Log_Height = height;
	ILI9341_Log_Height-=10;

	if(x>0 && y>0) {
		ILI9341_Draw_Rectangle(x,y,width, height, bcolor);
		ILI9341_Draw_Hollow_Rectangle(x,y,width-1, height-1, DARKGREY);
	}

}

#endif









