import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

/// light theme
ThemeData customLightTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: TextSelectionThemeData(cursorColor: accentColor),
      errorColor: fromHex('#B00020'),
      platform: defaultTargetPlatform,
      highlightColor: accentColor.withOpacity(.5),
      primaryColor: accentColor,
      indicatorColor: accentColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: accentColor),
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Color.fromRGBO(250, 250, 250, 1),
      accentColor: accentColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color.fromRGBO(240,240,240, 1),
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: EdgeInsets.all(15.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
         border: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#eceff1'), width: .5),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#eceff1'), width: .5),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#E5E5E5')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#B00020').withOpacity(.5)),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#B00020')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        labelStyle: Theme.of(context).textTheme.bodyText1,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: fromHex('#B00020')),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black.withOpacity(.5),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black),
            caption: TextStyle(color: Colors.black,),
            headline1: TextStyle(color: Colors.black,),
            headline2: TextStyle(color: Colors.black),
            headline3: TextStyle(color: Colors.black),
            headline4: TextStyle(color: Colors.black),
            headline5: TextStyle(color: Colors.black),
            headline6: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Colors.black),
            subtitle2: TextStyle(color: Colors.black),
            overline: TextStyle(color: Colors.black),
            button: TextStyle(color: Colors.black),
          ),
      dividerColor: Colors.grey,
      appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          elevation: 0,
          color: lightBackgroundColor,
          iconTheme: IconThemeData(color: accentColor),
          textTheme: Typography.material2018(platform: defaultTargetPlatform)
              .white
              .copyWith(
                bodyText1: TextStyle(color: Colors.black, fontSize: 17),
                bodyText2: TextStyle(color: Colors.black, fontSize: 14),
                caption: TextStyle(color: Colors.black, fontSize: 12),
                headline1: TextStyle(color: Colors.black, fontSize: 96),
                headline2: TextStyle(color: Colors.black, fontSize: 60),
                headline3: TextStyle(color: Colors.black, fontSize: 48),
                headline4: TextStyle(color: Colors.black, fontSize: 34),
                headline5: TextStyle(color: Colors.black, fontSize: 24),
                headline6: TextStyle(color: Colors.black, fontSize: 20),
                subtitle1: TextStyle(color: Colors.black, fontSize: 16),
                subtitle2: TextStyle(color: Colors.black, fontSize: 14),
                overline: TextStyle(color: Colors.black, fontSize: 10),
                button: TextStyle(color: Colors.black, fontSize: 16),
              )));
}

///dark theme
ThemeData customDarkTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: darkBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
       textSelectionTheme: TextSelectionThemeData(cursorColor: accentColor),
      errorColor: fromHex('#CF6679'),
      primaryColor: accentColor,
      indicatorColor: accentColor,
      highlightColor: accentColor.withOpacity(.5),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: accentColor),
      platform: defaultTargetPlatform,
      unselectedWidgetColor: Colors.grey,
      accentColor: accentColor,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Color.fromRGBO(31, 31, 31, 1),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.white.withOpacity(.7),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: TextStyle(color: Colors.white70),
            bodyText2: TextStyle(color: Colors.white70,),
            caption: TextStyle(color: Colors.white70),
            headline1: TextStyle(color: Colors.white70),
            headline2: TextStyle(color: Colors.white70,),
            headline3: TextStyle(color: Colors.white70,),
            headline4: TextStyle(color: Colors.white70,),
            headline5: TextStyle(color: Colors.white70,),
            headline6: TextStyle(color: Colors.white70,),
            subtitle1: TextStyle(color: Colors.white70,),
            subtitle2: TextStyle(color: Colors.white70),
            overline: TextStyle(color: Colors.white70,),
            button: TextStyle(color: Colors.white70),
          ),
      iconTheme: IconThemeData(color: Colors.white70),
      dividerColor: Colors.white.withOpacity(.6),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color.fromRGBO(50,55,61, 1),
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.normal),
        contentPadding: EdgeInsets.all(10.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
         border: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#eceff1'), width: .5),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#E5E5E5')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#CF6679').withOpacity(.5)),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#CF6679')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.white70),
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: fromHex('#CF6679')),
      ),
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: darkBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: accentColor),
          textTheme: Typography.material2018(platform: defaultTargetPlatform)
              .white
              .copyWith(
                bodyText1: TextStyle(color: Colors.white70, fontSize: 17),
                bodyText2: TextStyle(color: Colors.white70, fontSize: 14),
                caption: TextStyle(color: Colors.white70, fontSize: 12),
                headline1: TextStyle(color: Colors.white70, fontSize: 96),
                headline2: TextStyle(color: Colors.white70, fontSize: 60),
                headline3: TextStyle(color: Colors.white70, fontSize: 48),
                headline4: TextStyle(color: Colors.white70, fontSize: 34),
                headline5: TextStyle(color: Colors.white70, fontSize: 24),
                headline6: TextStyle(color: Colors.white70, fontSize: 20),
                subtitle1: TextStyle(color: Colors.white70, fontSize: 16),
                subtitle2: TextStyle(color: Colors.white70, fontSize: 14),
                overline: TextStyle(color: Colors.white70, fontSize: 10),
                button: TextStyle(color: Colors.white70, fontSize: 16),
              )));
}