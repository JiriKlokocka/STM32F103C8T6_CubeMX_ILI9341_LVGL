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
#include <stdio.h>

 /*
 https://lvgl.io/tools/fontconverter

 0x2a-0x3a,0x20,0xb0,0x43

 */


 /**********************
 *  STATIC VARIABLES
 **********************/
static lv_obj_t* labelHeader;
extern lv_indev_t* indev_encoder;
static lv_style_t style_buttons;
//static lv_obj_t * win;
static lv_obj_t* pgMain;
static lv_obj_t* pgHeader;
static lv_obj_t* btn1;
static lv_group_t* grpMain;
static lv_obj_t* btn1;
static lv_obj_t* btn2;
static lv_obj_t* btn3;
static lv_obj_t* btn4;
static lv_obj_t* btn5;
static lv_obj_t* btn6;
static lv_obj_t* btn7;
static lv_obj_t* btn8;
static lv_obj_t* btn9;
static lv_obj_t* btn10;
static lv_obj_t* slider_label;
static lv_obj_t* slider;




/**********************
*   GLOBAL FUNCTIONS
**********************/

static void JK_Test_Button(lv_obj_t* btn, lv_obj_t* parent, const char* symbol, const char* text, lv_event_cb_t btnEvent);
static void lv_page_close_event_cb(lv_obj_t* btn, lv_event_t event);
static void MY_btn2Event(lv_obj_t* btn, lv_event_t event);
static void slider_event_cb(lv_obj_t* slider, lv_event_t event);
void MY_lv_ex_slider_2(lv_obj_t* parent, uint16_t x, uint16_t y);

/**********************
*      FUNCTIONS
**********************/
void lvgl_GUI(void)
{
    //lv_scr_act()



        /*
        lv_obj_t * btn = lv_btn_create(lv_scr_act(), NULL);
        lv_obj_t* label = lv_label_create(btn, NULL);
        lv_label_set_text_fmt(label, "%s %s", LV_SYMBOL_HOME, "Test button");
        */

    pgHeader = lv_page_create(lv_scr_act(), NULL);
    lv_obj_set_pos(pgHeader, 0, 0);
    lv_obj_set_size(pgHeader, 320, 20);
    /*lv_obj_set_style_local_radius(pgHeader, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 1);
    lv_obj_set_style_local_pad_all(pgHeader, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 20);
    lv_obj_set_style_local_margin_all(pgHeader, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 0);
    lv_obj_set_style_local_bg_color(pgHeader, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, LV_COLOR_NAVY);*/

    labelHeader = lv_label_create(pgHeader, NULL);
    lv_label_set_text_fmt(labelHeader, "%s %s", LV_SYMBOL_HOME, "Settings");
    lv_obj_set_pos(labelHeader, 20, 7);
    /*lv_obj_set_style_local_pad_all(labelHeader, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 0);
    lv_obj_set_style_local_margin_all(labelHeader, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 0);
    lv_obj_set_style_local_bg_color(labelHeader, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, LV_COLOR_RED);*/


    pgMain = lv_page_create(lv_scr_act(), NULL);
    //lv_page_set_scrl_layout(pgMain, LV_LAYOUT_PRETTY_MID);
    lv_obj_set_pos(pgMain, 0, 31);
    lv_obj_set_size(pgMain, 320, 210);
    lv_obj_set_style_local_pad_inner(pgMain, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 0);
    lv_obj_set_style_local_pad_all(pgMain, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 20);
    lv_obj_set_style_local_margin_all(pgMain, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 0);
    lv_obj_set_style_local_radius(pgMain, LV_OBJ_PART_MAIN, LV_STATE_DEFAULT, 1);

    lv_style_init(&style_buttons);
    /*lv_style_set_text_color(&style_buttons,  LV_STATE_FOCUSED, LV_COLOR_WHITE);
    lv_style_set_bg_color(&style_buttons, LV_STATE_FOCUSED, LV_COLOR_RED);
    lv_style_set_margin_all(&style_buttons, LV_STATE_DEFAULT, 0);
    lv_style_set_pad_all(&style_buttons, LV_STATE_DEFAULT, 0);
    lv_style_set_radius(&style_buttons, LV_STATE_DEFAULT, 3);*/

    btn1 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn1, pgMain, LV_SYMBOL_WIFI, " Button1", NULL);
    btn2 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn2, pgMain, LV_SYMBOL_POWER, " Button2", MY_btn2Event);
    btn3 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn3, pgMain, LV_SYMBOL_KEYBOARD, " Button3", NULL);
    btn4 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn4, pgMain, LV_SYMBOL_SETTINGS, " Button4", NULL);
    btn5 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn5, pgMain, LV_SYMBOL_BLUETOOTH, " Button5", NULL);
    btn6 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn6, pgMain, LV_SYMBOL_SD_CARD, " Button6", NULL);
    btn7 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn7, pgMain, LV_SYMBOL_DIRECTORY, " Button7", NULL);
    btn8 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn8, pgMain, LV_SYMBOL_HOME, " Button8", NULL);
    btn9 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn9, pgMain, LV_SYMBOL_EJECT, " Button9", NULL);
    btn10 = lv_btn_create(pgMain, NULL);
    JK_Test_Button(btn10, pgMain, LV_SYMBOL_EYE_OPEN, " Button10", NULL);

    grpMain = lv_group_create();

    lv_group_add_obj(grpMain, btn1);
    lv_group_add_obj(grpMain, btn2);
    lv_group_add_obj(grpMain, btn3);
    lv_group_add_obj(grpMain, btn4);
    lv_group_add_obj(grpMain, btn5);
    lv_group_add_obj(grpMain, btn6);
    lv_group_add_obj(grpMain, btn7);
    lv_group_add_obj(grpMain, btn8);
    lv_group_add_obj(grpMain, btn9);
    lv_group_add_obj(grpMain, btn10);

    lv_indev_set_group(indev_encoder, grpMain);
}

static void JK_Test_Button(lv_obj_t* btn, lv_obj_t* parent, const char* symbol, const char* text, lv_event_cb_t event_cb) {
    static uint16_t posX = 10, posY = 10;
    uint16_t width = 130, height = 30, xShift = 20, yShift = 10;

    //btn = lv_btn_create(parent, NULL);
    //lv_group_add_obj(grpMain, btn);
    lv_obj_set_pos(btn, posX, posY);
    lv_obj_set_size(btn, width, height);
    lv_obj_set_event_cb(btn, event_cb);
    //btn->event_cb = event_cb;

    //Button label
    lv_obj_t* label = lv_label_create(btn, NULL);
    lv_label_set_text_fmt(label, "%s %s", symbol, text);
    lv_obj_add_style(btn, LV_BTN_PART_MAIN, &style_buttons);


    if ((posY + height + yShift) < lv_obj_get_height(pgMain)) {
        posY = posY + height + yShift;
    }
    else {
        posX = posX + width + xShift;
        posY = yShift;
    }

}

static void MY_btn2Event(lv_obj_t* btn, lv_event_t event) {
    if (event == LV_EVENT_RELEASED) {
        lv_obj_t* pgDialog = lv_page_create(pgMain, NULL);
        lv_obj_set_pos(pgDialog, 35, 25);
        lv_obj_set_size(pgDialog, 250, 160);
        lv_page_set_scrl_layout(pgDialog, LV_LAYOUT_COLUMN_MID);

        MY_lv_ex_slider_2(pgDialog, 20, 20);

        lv_obj_t* btn = lv_btn_create(pgDialog, NULL);
        lv_obj_set_event_cb(btn, lv_page_close_event_cb);
        lv_obj_t* label = lv_label_create(btn, NULL);
        lv_label_set_text_fmt(label, "%s %s", LV_SYMBOL_CLOSE, "Close");
        lv_obj_add_style(btn, LV_BTN_PART_MAIN, &style_buttons);
        lv_obj_set_pos(btn, 10, 70);
        lv_obj_set_size(btn, 110, 30);
        lv_obj_add_style(btn, LV_BTN_PART_MAIN, &style_buttons);
#ifndef THISISSIMULATIONYOUMORON
        lv_group_t* grpDialog = lv_group_create();
        lv_group_add_obj(grpDialog, btn);
        lv_group_add_obj(grpDialog, slider);
        lv_indev_set_group(indev_encoder, grpDialog);
#endif // !THISISSIMULATIONYOUMORON

        lv_group_focus_obj(btn);
    }

}

static void lv_page_close_event_cb(lv_obj_t* btn, lv_event_t event)
{
    LV_ASSERT_OBJ(btn, "lv_btn");

    if (event == LV_EVENT_RELEASED) {
        lv_obj_t* page = lv_win_get_from_btn(btn);

        lv_obj_del(page);
        //lv_group_focus_obj(btn1);

        lv_indev_set_group(indev_encoder, grpMain);
    }
}

void JK_SetEncoderText(int16_t valEnc, uint16_t valBtn) {
    //lv_label_set_text_fmt(labelHeader, "Enc:%i Btn:%i",valEnc, valBtn);
}





void MY_lv_ex_slider_2(lv_obj_t* parent, uint16_t x, uint16_t y)
{

    slider = lv_slider_create(parent, NULL);
    lv_obj_set_width(slider, 180); //lv_obj_get_width(parent - 50)
    //lv_obj_set_pos(slider, x, y);
    lv_obj_set_event_cb(slider, slider_event_cb);
    lv_slider_set_range(slider, 0, 30);

    /* Create a label below the slider */
    slider_label = lv_label_create(parent, NULL);
    lv_label_set_text(slider_label, "0");
    //lv_obj_set_auto_realign(slider_label, true);
    //lv_obj_set_pos(slider_label, x+40, y + 25);

}

static void slider_event_cb(lv_obj_t* slider, lv_event_t event)
{
    if (event == LV_EVENT_VALUE_CHANGED) {
        static char buf[4]; /* max 3 bytes for number plus 1 null terminating byte */
        snprintf(buf, 4, "%u", lv_slider_get_value(slider));
        lv_label_set_text(slider_label, buf);
    }
}

