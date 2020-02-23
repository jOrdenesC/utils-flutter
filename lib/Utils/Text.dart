import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Widgets de texto responsivos con el paquete screenutil
//Paquetes necesarios: flutter_screenutil: ^1.0.2

Widget messageExtraSmall(String mensaje, var color) {
  return Text(mensaje,
      style: TextStyle(fontSize: 16.0, color: color),
      textAlign: TextAlign.center);
}

Widget messageSmall(String mensaje, BuildContext context) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      textAlign: TextAlign.center);
}

Widget messageSmallAlert(String mensaje, BuildContext context) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
          color: Colors.black),
      textAlign: TextAlign.center);
}

Widget messageSmallNormal(String mensaje, var color) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
          color: color),
      textAlign: TextAlign.center);
}

Widget messageSmallLeft(String mensaje, var color) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
          color: color),
      textAlign: TextAlign.left);
}

Widget messageSmallSub(String mensaje, var color) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
          color: color,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline),
      textAlign: TextAlign.center);
}

Widget messageMedium(String mensaje, var color) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
          color: color),
      textAlign: TextAlign.center);
}

Widget messageMediumBold(String mensaje, var color) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
          fontWeight: FontWeight.bold,
          color: color),
      textAlign: TextAlign.center);
}

Widget messageBig(String mensaje, var color) {
  return Text(mensaje,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(50, allowFontScalingSelf: true),
          color: color),
      textAlign: TextAlign.center);
}
