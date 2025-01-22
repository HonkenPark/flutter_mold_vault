import 'package:flutter/material.dart';

/// Determine the Text color consider its background color
/// argument: backgroundColor (Color) - background color
/// return: Color - text color
/// example: getTextColorInBg(Colors.white) -> Colors.black
/// reference: https://stackoverflow.com/questions/1855884/determine-font-color-based-on-background-color
Color getTextColorInBg(Color backgroundColor) {
  double luminance = (0.299 * backgroundColor.r + 0.587 * backgroundColor.g + 0.114 * backgroundColor.b);
  return luminance > 128 ? Colors.black : Colors.white;
}
