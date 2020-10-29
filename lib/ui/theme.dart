import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  get theme {
    return ThemeData(
      // Define the default brightness and colors.
      // brightness: Brightness.dark,
      primaryColor: Color(0xFFFE3F32),
      // accentColor: Colors.cyan[600],

      // Define the default font family.
      // fontFamily: 'steady',
      // backgroundColor: Colors.grey,
      scaffoldBackgroundColor: Colors.grey[100],

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: GoogleFonts.darkerGrotesqueTextTheme(),
    );
  }
}
