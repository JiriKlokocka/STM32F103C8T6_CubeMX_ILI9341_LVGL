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
lv_obj_t* labelEncoder;
extern lv_indev_t * indev_encoder;
static lv_style_t style_buttons;
lv_group_t * g = lv_group_create();

/**********************
*   GLOBAL FUNCTIONS
**********************/

static void JK_Test_Button(lv_obj_t* parent, const char* symbol, const char* text);


/**********************
*      FUNCTIONS
**********************/
void lvgl_GUI(void)
{
//lv_scr_act()

	lv_group_t * g = lv_group_create();

    lv_style_init(&style_buttons);
    lv_style_set_text_color(&style_buttons,  LV_STATE_FOCUSED, LV_COLOR_AQUA);
    lv_style_set_bg_color(&style_buttons, LV_STATE_FOCUSED, LV_COLOR_RED);

    /*Create a window*/
    lv_obj_t * win = lv_win_create(lv_scr_act(), NULL);
    lv_obj_add_style(win, LV_CONT_PART_MAIN, &style_buttons);
    lv_win_set_title(win, "Window title");
    lv_win_set_layout(win, LV_LAYOUT_COLUMN_MID); //LV_LAYOUT_COLUMN_MID
    lv_obj_set_style_local_text_font(win, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, &lv_font_montserrat_16);
    lv_win_set_header_height(win, LV_DPX(50));
    /*Add control button to the header*/
    lv_obj_t * close_btn = lv_win_add_btn(win, LV_SYMBOL_CLOSE);
    //lv_obj_set_event_cb(close_btn, lv_win_close_event_cb);
    lv_obj_add_style(close_btn, LV_CONT_PART_MAIN, &style_buttons);

    lv_obj_t * settings_btn = lv_win_add_btn(win, LV_SYMBOL_SETTINGS);
    lv_obj_add_style(settings_btn, LV_CONT_PART_MAIN, &style_buttons);


	JK_Test_Button(win, LV_SYMBOL_WIFI, " Button1");
	JK_Test_Button(win, LV_SYMBOL_POWER, " Button2");
	JK_Test_Button(win, LV_SYMBOL_KEYBOARD," Button3");
	JK_Test_Button(win, LV_SYMBOL_SETTINGS," Button4");
	JK_Test_Button(win, LV_SYMBOL_BLUETOOTH," Button5");
	JK_Test_Button(win, LV_SYMBOL_SD_CARD," Button6");
	JK_Test_Button(win, LV_SYMBOL_DIRECTORY," Button7");
	JK_Test_Button(win, LV_SYMBOL_HOME," Button8");
	JK_Test_Button(win, LV_SYMBOL_EJECT," Button9");
	JK_Test_Button(win, LV_SYMBOL_EYE_OPEN," Button10");

	lv_group_add_obj(g, win);
	lv_group_add_obj(g, labelEncoder);
	lv_group_add_obj(g, close_btn);
	lv_group_add_obj(g, settings_btn);

	lv_indev_set_group(indev_encoder, g);



}


void JK_SetEncoderText(int16_t valEnc, uint16_t valBtn) {
	lv_label_set_text_fmt(labelEncoder, "Enc:%i Btn:%i",valEnc, valBtn);
}



static void JK_Test_Button(lv_obj_t* parent, const char* symbol, const char* text) {
lv_obj_t* btn = lv_btn_create(parent, NULL);
    //lv_obj_set_pos(btn, 10, 10);
    lv_obj_set_size(btn, 150, 50);
    //lv_obj_set_event_cb(btn, btn_event_cb);
    //Button label
    lv_obj_t* label = lv_label_create(btn, NULL);
    lv_label_set_text_fmt(label, "%s %s", symbol, text);
}




