import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

const colorSchme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff091970), // netrual lightgrey & grey and 100% white FFFF
    onPrimary: Color(0xff212121), // rich black //fresh green
    secondary: Color(0xff212121),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Color(0xffFAFAFA),
    surface: Color(0xffFAFAFA ),
    onSurface: Color(0xff212121)
);
ThemeData lightTheme = ThemeData(
  fontFamily: "sfpro",
  colorScheme: colorSchme,
  scaffoldBackgroundColor: colorSchme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: colorSchme.surface,
  ),
  iconTheme: const IconThemeData(
    color:  Color(0xff212121),
  ),
  textTheme:  TextTheme(
    titleMedium: GoogleFonts.hanuman(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: colorSchme.onPrimary,
    ),
    titleSmall: GoogleFonts.hanuman(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: colorSchme.onPrimary,
    ),
    bodyMedium: GoogleFonts.hanuman(
      fontSize: 18,
      color: colorSchme.onPrimary,
    ),
    bodySmall: GoogleFonts.hanuman(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: colorSchme.onPrimary,
    ),
  )
);
