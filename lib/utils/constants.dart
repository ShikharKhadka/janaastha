import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String LOGO = "assets/images/logo.png";

//Creating constant titleStyle for whole app
TextStyle get appBarStyle {
  return TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white);
}

//Creating constant titleStyle for whole app
TextStyle get titleStyle {
  return TextStyle(
      fontSize: 19.sp, fontWeight: FontWeight.bold, color: Colors.black);
}

//Creating constant titleStyle for whole app
TextStyle get titleStyle1 {
  return TextStyle(
      fontSize: 17.sp, fontWeight: FontWeight.bold, color: Colors.black);
}

//Creating constant subtitleStyle for whole app
TextStyle get subtitleStyle {
  return TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.black);
}

//Creating constant normal textstyle for whole app
TextStyle get normalStyle {
  return TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black);
}

TextStyle get normalStylewithBold {
  return TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );
}

TextStyle get headingStylewithBold {
  return TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );
}

//Creating constant time and author textstyle for whole app
TextStyle get authorStyle {
  return TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.grey);
}

//Creating constant dateStyle textstyle for whole app
TextStyle get dateStyle {
  return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      letterSpacing: 1);
}



mixin AppColors {
  static const primaryColor = Color(0xff0f4a9e);
  static const secColor = Color(0xffa7091f);
  static const darkGreyColor = Color.fromARGB(255, 51, 51, 51);
  static const whiteColor = Colors.white;
  static const greyColor = Colors.grey;
  static Color iconColor = Colors.grey.shade600;
}
