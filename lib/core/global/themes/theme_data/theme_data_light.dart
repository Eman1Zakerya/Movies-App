import 'package:flutter/material.dart';
import 'package:movies_app/core/global/themes/app_color_dark.dart';

ThemeData getThemeDataLight()=> ThemeData(
    primaryColor: AppColorLight.primaryColor,
    appBarTheme: const AppBarTheme(
        color: AppColorLight.appBarColor
    ),
    // buttonTheme: ,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.amberAccent)
        )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.red
    ),
    switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.amberAccent),
        thumbColor: MaterialStateProperty.all(Colors.blue)
    ),
    textTheme: getTextTheme(),
    iconTheme: IconThemeData(
        size: 50,
        color: Colors.amberAccent
    )

);

 TextTheme getTextTheme()=>TextTheme(
    displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 40
    )
);