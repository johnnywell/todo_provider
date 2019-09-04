import 'package:flutter/material.dart';

var appTheme = ThemeData(
  primaryColor: Color(0xfffafafa),
  accentColor: Color(0xffff9940),
  splashColor: Color(0xfffa8d3e),
  fontFamily: 'Montserrat',
  cardTheme: CardTheme(
    margin: EdgeInsets.all(5.0),
    
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0)
    )
  )
);