import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFF8BBD0), // soft pink seed
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
  scaffoldBackgroundColor: Color(0xFFFFF7FB),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
  ),
);