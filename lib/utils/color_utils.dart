import 'package:flutter/material.dart';

/// Determine the Text color consider its background color
Color getTextColorInBg(Color backgroundColor) {
  double luminance = (0.299 * backgroundColor.red + 0.587 * backgroundColor.green + 0.114 * backgroundColor.blue);
  return luminance > 128 ? Colors.black : Colors.white;
}
