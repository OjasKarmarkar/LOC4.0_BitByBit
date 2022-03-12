import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData light(context) => ThemeData.light().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal,
            ),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal,
            ),
          },
        ),

        //textTheme: Theme.of(context).textTheme,
        // textSelectionTheme:
        //     const TextSelectionThemeData(cursorColor: accentColor),
        // colorScheme: ThemeData().colorScheme.copyWith(primary: accentColor),

        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.copyWith(
              bodyText2: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18)),
        ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white)),
        scaffoldBackgroundColor: Colors.white,
      );
  static ThemeData dark(context) => ThemeData.dark().copyWith(
    cardTheme: CardTheme(color: Color(0xff003153),),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal,
            ),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal,
            ),
          },
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.copyWith(
              bodyText2: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18)),
        ),
        primaryColor: Color(0xff172A3A),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white),
            //   color: Color(0xFFFFFFFF),
            backgroundColor: Color(0xff172A3A),
            //  backgroundColor: Color(0xFFFFFFFF),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xff172A3A),
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor:Color(0xff172A3A))),
        scaffoldBackgroundColor: Color(0xff172A3A),
      );
}
