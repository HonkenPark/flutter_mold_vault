import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showSnackbar(String title, String message) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    colorText: Colors.black,
  );
}
