import "package:flutter/material.dart";

const MAIN_COLOR = Color(0xFF303030);
const DARK_COLOR = Color(0xFFBDBDBD);
const BOTTOM_COLORS = [MAIN_COLOR, DARK_COLOR];
const YELLOW = Color(0xfffbed96);
const BLUE = Color(0xffabecd6);
const BLUE_DEEP = Color(0xffA8CBFD);
const BLUE_LIGHT = Color(0xffAED3EA);
const PURPLE = Color(0xffccc3fc);
const SIGNUP_LIGHT_RED = Color(0xffffc2a1);
const SIGNUP_RED = Color(0xffffb1bb);
const RED = Color(0xffF2A7B3);
const GREEN = Color(0xffc7e5b4);
const RED_LIGHT = Color(0xffFFC3A0);
const TEXT_BLACK = Color(0xFF353535);
const TEXT_BLACK_LIGHT = Color(0xFF34323D);
const TEXT_ABC_DRIVER = Color(0xFF267F00);
const COLOR_ERR = Color(0xfff1416c);
const BACKGROUND = Color(0xFFF3F5F7);
const TEXT_DEFAULT = Color(0xFF263238);
const ryco_red = Color(0xFFED1B2F);

const themeColor = AppColor.colorPrimary;

class LocalColors {
  static const BACKGROUND = Color(0xFFF3F5F7);
  static const TEXT_ABC_DRIVER = Color(0xFF267F00);

  static const text_color = Color(0xFF3f4254);
  static const text_color_grey = Color(0xFFb5b5c3);

  static const text_red = Color(0xfff1416c);
  static const text_red_light = Color(0xfffff5f8);

  static const text_purple = Color(0xff7239ea);
  static const text_purple_light = Color(0xfff8f5ff);

  static const text_blue = Color(0xff0094FF);
  static const icon_blue = Color(0xff00B2FB);
  static const icon_blue_bg = Color(0xfff1faff);
  static const text_blue_light = Color(0xFFE1F0FF);

  static const text_green = Color(0xff50cd89);
  static const text_green_light = Color(0xFFE8FFF3);

  static const text_yellow = Color(0xffFFC700);
  static const text_yellow_light = Color(0xFFFFF8DD);

  static const bg = Color(0xfff9fafb);
  static const appbar_bg = Color(0xfff5f8fa);
  static const appbar_bg_w = Color(0xffffffff);
  static const icon_card_bg = Color(0xfff9f9f9);

  static const text_white = Color(0x0fffffff);
  static const text_primary = Color(0xff009ef7);
  static const text_secondary = Color(0xffdbdfe9);
  static const text_light = Color(0xfff9f9f9);
  static const text_success = Color(0xff50cd89);
  static const text_info = Color(0xff7239ea);
  static const text_warning = Color(0xffffc700);
  static const text_danger = Color(0xfff1416c);
  static const text_dark = Color(0xff071437);
  static const text_muted = Color(0xff99a1b7);
  static const text_gray_100 = Color(0xfff9f9f9);
  static const text_gray_200 = Color(0xfff1f1f2);
  static const text_gray_300 = Color(0xffdbdfe9);
  static const text_gray_400 = Color(0xffb5b5c3);
  static const text_gray_500 = Color(0xff99a1b7);
  static const text_gray_600 = Color(0xff78829d);
  static const text_gray_700 = Color(0xff4b5675);
  static const text_gray_800 = Color(0xff252f4a);
  static const text_gray_900 = Color(0xff071437);

  static const bg_blue = Color(0xff0d6efd);
  static const bg_indigo = Color(0xff6610f2);
  static const bg_purple = Color(0xff6f42c1);
  static const bg_pink = Color(0xffd63384);
  static const bg_red = Color(0xffdc3545);
  static const bg_orange = Color(0xfffd7e14);
  static const bg_yellow = Color(0xffffc107);
  static const bg_green = Color(0xff198754);
  static const bg_teal = Color(0xff20c997);
  static const bg_cyan = Color(0xff0dcaf0);
  static const bg_black = Color(0x000ff000);
  static const bg_white = Color(0x000fffff);
  static const bg_gray = Color(0xff78829d);
  static const bg_gray_dark = Color(0xff252f4a);
  static const bg_light = Color(0xfff9f9f9);
  static const bg_primary = Color(0xff009ef7);
  static const bg_secondary = Color(0xffdbdfe9);
  static const bg_success = Color(0xff50cd89);
  static const bg_info = Color(0xff7239ea);
  static const bg_warning = Color(0xffffc700);
  static const bg_danger = Color(0xfff1416c);
  static const bg_dark = Color(0xff071437);
  static const bg_primary_active = Color(0xff0095e8);
  static const bg_secondary_active = Color(0xffb5b5c3);
  static const bg_light_active = Color(0xfff1f1f2);
  static const bg_success_active = Color(0xff47be7d);
  static const bg_info_active = Color(0xff5014d0);
  static const bg_warning_active = Color(0xfff1bc00);
  static const bg_danger_active = Color(0xffd9214e);
  static const bg_dark_active = Color(0xff050f29);
  static const bg_primary_light = Color(0xfff1faff);
  static const bg_secondary_light = Color(0xfff9f9f9);
  static const bg_succesg_light = Color(0xffe8fff3);
  static const bg_info_light = Color(0xfff8f5ff);
  static const bg_warning_light = Color(0xfffff8dd);
  static const bg_danger_light = Color(0xfffff5f8);
  static const bg_dark_light = Color(0xfff1f1f2);
  static const bg_primary_inverse = Color(0xfffffffff);
  static const bg_secondary_inverse = Color(0xff4b5675);
  static const bg_light_inverse = Color(0xff78829d);
  static const bg_success_inverse = Color(0xfffffffff);
  static const bg_info_inverse = Color(0xfffffffff);
  static const bg_warning_inverse = Color(0xfffffff);
  static const bg_danger_inverse = Color(0x0fffffff);
  static const bg_dark_inverse = Color(0x0fffffff);
}

class AppColor {
  static const colorPrimary = LocalColors.text_blue;
  static const colorPrimaryBg = LocalColors.text_blue_light;
  static const textColor = LocalColors.text_color;
  static const colorDanger = LocalColors.text_red;
  static const colorDangerBg = LocalColors.text_red_light;
  static const colorSuccess = LocalColors.text_green;
  static const colorSuccessBg = LocalColors.text_green_light;
  static const colorInfo = LocalColors.text_purple;
  static const colorInfoBg = LocalColors.text_purple_light;
  static const colorWarn = LocalColors.text_yellow;
  static const colorWarnBg = LocalColors.text_yellow_light;
}
