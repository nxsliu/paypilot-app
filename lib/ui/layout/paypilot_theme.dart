import 'package:flutter/material.dart';
import 'package:paypilot/ui/layout/material_color_creator.dart';

class PayPilotTheme {
  static const primaryColour = Color(0xFFB2FCE4);
  static const secondaryColour = Colors.white;
  static const babyBlueColour = Color(0xFFCBE0DD);

  final babyBlueSwatch = createMaterialColor(const Color(0xFFCBE0DD));

  static const textTheme = TextTheme(titleMedium: TextStyle(fontSize: 18));

  static AppBarTheme appBarTheme = const AppBarTheme(
    elevation: 0.0,
    color: secondaryColour,
    iconTheme: IconThemeData(color: primaryColour),
  );
}
