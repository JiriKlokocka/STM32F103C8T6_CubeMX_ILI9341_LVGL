/*
 * lvgl_GUI.c
 *
 *  Created on: Nov 19, 2020
 *      Author: KlokockaJir
 */

/*********************
*      INCLUDES
*********************/
#include "lvgl/lvgl.h"
#include "lvgl_GUI.h"
#include "lvgl_init_f103.h"

/*
https://lvgl.io/tools/fontconverter

0x2a-0x3a,0x20,0xb0,0x43

*/


/**********************
*  STATIC VARIABLES
**********************/
static lv_obj_t* labelEncoder;
extern lv_indev_t * indev_encoder;
static lv_style_t style_buttons;
static lv_obj_t * win;
static lv_obj_t * btn1;
static lv_group_t * g;
static lv_obj_t * btn1;
lv_obj_t * btn2;
lv_obj_t * btn3;
/*lv_obj_t * btn4;
lv_obj_t * btn5;
lv_obj_t * btn6;
lv_obj_t * btn7;
lv_obj_t * btn8;
lv_obj_t * btn9;
lv_obj_t * btn10;


/**********************
*   GLOBAL FUNCTIONS
**********************/

static void JK_Test_Button(lv_obj_t * btn, lv_obj_t* parent, const char* symbol, const char* text);


/**********************
*      FUNCTIONS
**********************/
void lvgl_GUI(void)
{
//lv_scr_act()¨



    lv_obj_t * btn = lv_btn_create(lv_scr_act(), NULL);
    lv_obj_t* label = lv_label_create(btn, NULL);
    lv_label_set_text_fmt(label, "%s %s", LV_SYMBOL_HOME, "Test button");

	/*
	g = lv_group_create();

    lv_style_init(&style_buttons);
    lv_style_set_text_color(&style_buttons,  LV_STATE_FOCUSED, LV_COLOR_AQUA);
    lv_style_set_bg_color(&style_buttons, LV_STATE_FOCUSED, LV_COLOR_RED);

    static lv_style_t style_windows;
	lv_style_init(&style_windows);
    lv_style_set_text_color(&style_windows,  LV_STATE_DEFAULT, LV_COLOR_AQUA);
    lv_style_set_bg_color(&style_windows, LV_STATE_DEFAULT, LV_COLOR_NAVY);

    //Create a window
    win = lv_win_create(lv_scr_act(), NULL);
    //lv_obj_add_style(win, LV_CONT_PART_MAIN, &style_buttons);
    lv_win_set_title(win, "Window title");
    lv_win_set_header_height(win, LV_DPX(30));
    lv_obj_add_style(win, LV_WIN_PART_HEADER, &style_windows);
    lv_obj_set_style_local_text_font(win, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, &lv_font_montserrat_16);

    //Add control button to the header
    lv_obj_t * close_btn = lv_win_add_btn(win, LV_SYMBOL_CLOSE);
    lv_obj_add_style(close_btn, LV_BTN_PART_MAIN, &style_buttons);
    //lv_obj_set_event_cb(close_btn, lv_win_close_event_cb);

    lv_obj_t * settings_btn = lv_win_add_btn(win, LV_SYMBOL_SETTINGS);
    lv_obj_add_style(settings_btn, LV_BTN_PART_MAIN, &style_buttons);

    lv_win_set_layout(win, LV_LAYOUT_COLUMN_MID); //LV_LAYOUT_COLUMN_MID

	JK_Test_Button(btn1, win, LV_SYMBOL_WIFI, " Button1");
	//JK_Test_Button(btn2, win, LV_SYMBOL_POWER, " Button2");
	/*JK_Test_Button(btn3, win, LV_SYMBOL_KEYBOARD," Button3");
	JK_Test_Button(btn4, win, LV_SYMBOL_SETTINGS," Button4");
	JK_Test_Button(btn5, win, LV_SYMBOL_BLUETOOTH," Button5");
	JK_Test_Button(btn6, win, LV_SYMBOL_SD_CARD," Button6");
	JK_Test_Button(btn7, win, LV_SYMBOL_DIRECTORY," Button7");
	JK_Test_Button(btn8, win, LV_SYMBOL_HOME," Button8");
	JK_Test_Button(btn9, win, LV_SYMBOL_EJECT," Button9");
	JK_Test_Button(btn10, win, LV_SYMBOL_EYE_OPEN," Button10");*/

    /*
	lv_group_add_obj(g, win);
	//lv_group_add_obj(g, labelEncoder);
	lv_group_add_obj(g, close_btn);
	lv_group_add_obj(g, settings_btn);
	//lv_group_add_obj(g, btn1);
	//lv_group_add_obj(g, btn2);
	//lv_group_add_obj(g, btn3);

	lv_indev_set_group(indev_encoder, g);
	*/



}


void JK_SetEncoderText(int16_t valEnc, uint16_t valBtn) {
	lv_label_set_text_fmt(labelEncoder, "Enc:%i Btn:%i",valEnc, valBtn);
}

static void JK_Test_Button(lv_obj_t * btn, lv_obj_t* parent, const char* symbol, const char* text) {
	btn = lv_btn_create(parent, NULL);
	lv_group_add_obj(g, btn);
    //lv_obj_set_pos(btn, 10, 10);
    lv_obj_set_size(btn, 140, 30);
    //lv_obj_set_event_cb(btn, btn_event_cb);
    //Button label
    lv_obj_t* label = lv_label_create(btn, NULL);
    lv_label_set_text_fmt(label, "%s %s", symbol, text);
    lv_obj_add_style(btn, LV_BTN_PART_MAIN, &style_buttons);
}




