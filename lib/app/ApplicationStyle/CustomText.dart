import 'package:application/app/ApplicationStyle/FontResources.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:flutter/material.dart';
class StyleResources {
  static TextStyle APP_BAR_TITLE_STYLE =  const TextStyle(
      fontSize: FontResources.titleSizeLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.PrimaryColorDark,
      fontStyle: FontStyle.normal,
      fontFamily: 'Montserrat Thin');

  static TextStyle HINT_TEXT_FONT_STYLE_INPUT = const TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: FontResources.SizeMedium,
      color: AppColors.TextColor2,
      fontFamily: 'Inter');
  static TextStyle TITLE = const TextStyle(
     // fontSize: FontResources.spacing_middle_new,
      fontSize: FontResources.titleSizeLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.TextColor3,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
        static TextStyle TITLE_Small = const TextStyle(
     // fontSize: FontResources.spacing_middle_new,
      fontSize: FontResources.textSizeSmall,
      fontWeight: FontWeight.bold,
      color: AppColors.TextColor3,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
        static TextStyle MINITITLE = const TextStyle(
     // fontSize: FontResources.spacing_middle_new,
      fontSize: FontResources.textSizeLargeMedium,
      fontWeight: FontWeight.bold,
      color: AppColors.TextColor3,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
  static TextStyle WHITETITLE = const TextStyle(
      fontSize: FontResources.titleSizeLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.PrimaryColorDark,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
  static TextStyle SMALLTITLE = const TextStyle(
      fontSize: FontResources.SizeMedium,
      fontWeight: FontWeight.bold,
      color: AppColors.TextColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');

 static TextStyle BIGTITLE = const TextStyle(
      fontSize: FontResources.titleSizeLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.TextColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');

  static TextStyle TITLE_STYLE = const TextStyle(
      fontSize: FontResources.textSizeMedium,
      fontWeight: FontWeight.w800,
      color: AppColors.TextColor4,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
      
  static TextStyle SUBTITLE_TITLE_STYLE = const TextStyle(
      fontSize: FontResources.textSizeMedium,
      fontWeight: FontWeight.normal,
      color: AppColors.TextColor4,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
      static TextStyle SUBTITLE_TITLE = const TextStyle(
      fontSize: FontResources.SizeSmall,
      fontWeight: FontWeight.normal,
      color: AppColors.TextColor4,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
  static TextStyle MeduimTitle = const TextStyle(
     fontSize: FontResources.textSizeMedium,
      fontWeight: FontWeight.w500,
      color: AppColors.TextColor2,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');

 /* static TextStyle SUBTITLE_TITLE_STYLE = TextStyle(
      fontSize: FontResources.textSizeSmall,
      fontWeight: FontWeight.w500,
      color: AppColors.t12_text_color_primary.withOpacity(0.5),
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter'); */
 static TextStyle TEXT_STYLE = const TextStyle(
      fontSize: FontResources.textSizeSmall,
      fontWeight: FontWeight.normal,
      color: AppColors.TextColor3,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
  static TextStyle LABEL_TEXT_STYLE = const TextStyle(
    
      fontSize: FontResources.textSizeSmall,

      fontWeight: FontWeight.normal,
      color: AppColors.TextColor2,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');

  static TextStyle VALUE_TEXT_STYLE = const TextStyle(
      fontSize: FontResources.SizeMedium,
      fontWeight: FontWeight.w500,
      color: AppColors.TextColor4,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');

  static TextStyle SECONDARY_LABEL_TEXT_STYLE = const TextStyle(
     fontSize: FontResources.textSizeSmall,
      fontWeight: FontWeight.w500,
      color: AppColors.TextColor1,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');

  static TextStyle PRIMARY_RICH_TEXT_FONT_STYLE = const TextStyle(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      fontSize: FontResources.textSizeMedium,
      color: AppColors.PrimaryColorLight,
      fontFamily: 'Inter');

  static TextStyle SECONDARY_RICH_TEXT_FONT_STYLE = const TextStyle(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      fontSize: FontResources.SizeSmall,
      color: AppColors.PrimaryColorLight,
      fontFamily: 'Inter');

 static TextStyle SELECTED_TEXT_FONT_STYLE = const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: FontResources.textSizeMedium,
      color: AppColors.TextColor3,
      fontFamily: 'Inter');

  static TextStyle DROPDOWN_TITLE_TEXT_STYLE = TextStyle(
    
    fontSize: FontResources.textSizeSmall,

      fontWeight: FontWeight.normal,
      color: AppColors.PrimaryColorDark,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');
 

/*   static TextStyle DROPDOWN_TEXT_STYLE = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Colors.grey.shade700,
    fontStyle: FontStyle.normal,
  );

  static TextStyle INPUT_TEXT_STYLE = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Colors.grey.shade700,
    fontStyle: FontStyle.normal,
  );

  static TextStyle WHITE_TEXT_STYLE = const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: FontResources.textSizeSMedium,
      color: AppColors.t12_white,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter');
  static TextStyle WHITE_TITLE_STYLE = const TextStyle(
      fontSize: FontResources.spacing_middle_new,
      fontWeight: FontWeight.w700,
      color: AppColors.t12_white,
      fontStyle: FontStyle.normal,
      fontFamily: 'Inter');

  static OutlineInputBorder ROUNDED_EDIT_TEXT_BORDER = OutlineInputBorder(
    borderRadius: BorderRadius.circular(FontResources.circular_border),
    borderSide:  const BorderSide(
      color: AppColors.t12_border_color,
    ),
  );

  static TextStyle EDIT_TEXT_FONT_STYLE = const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );

  static InputDecoration FORM_DECORATION = const InputDecoration(
      border: InputBorder.none, isCollapsed: true
  );
  static TextStyle SECOND_HINT_TEXT_FONT_STYLE_INPUT = const TextStyle(
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    //  fontSize: FontResources.textSizeSmall,
      color: Colors.black26,
      fontFamily: 'Inter');

  static InputDecoration ROUNDED_EDIT_TEXT(String? hintText,
      {Icon? fieldIcon, IconButton? suffix}) {
    return InputDecoration(
      disabledBorder: ROUNDED_EDIT_TEXT_BORDER,
      focusedBorder: ROUNDED_EDIT_TEXT_BORDER,
      enabledBorder: ROUNDED_EDIT_TEXT_BORDER,
      hintText: hintText,
      icon: fieldIcon,
      hintStyle: StyleResources.HINT_TEXT_FONT_STYLE_INPUT,
      filled: true,
      isDense: false,
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 12, 😎,
    ));
  }
  static var statusBarHeight = MediaQuery.of(Get.context!).size.height / 15;
  static var appBarHeight = AppBar().preferredSize.height;

  static List<BoxShadow>? App_Bar_Shadow = [
    const BoxShadow(
      color: Color.fromRGBO(72, 72, 72, 0.08),
      spreadRadius: 0,
      blurRadius: 16,
      offset: Offset(0, 😎, // changes position of shadow
     )),
  ];*/
}

