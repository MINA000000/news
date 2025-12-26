import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Color(0xff39A552);
  static Color white = Color(0xffffffff);
  static Color black = Color(0xff303030);
  static Color navy = Color(0xff4F5A69);
  static Color grey = Color(0xffA3A3A3);
  static Color sportsColor = Color(0xffC91C22);
  static Color politicsColor = Color(0xff003E90);
  static Color healthColor = Color(0xffED1E79);
  static Color businessColor = Color(0xffCF7E48);
  static Color environmentColor = Color(0xff4882CF);
  static Color scienceColor = Color(0xffF2D352);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      foregroundColor: white,
      backgroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(color: white, fontSize: 22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: black,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: navy,
      ),
      titleSmall: TextStyle(
        color: primary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(scaffoldBackgroundColor: Colors.blue);
}
