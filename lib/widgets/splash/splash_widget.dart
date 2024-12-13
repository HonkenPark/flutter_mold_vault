import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_mold_vault/views/home_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..forward();

    Future.delayed(const Duration(seconds: 2), () {
      /// Verify that certain types of objects are registered with the GetX dependency injection system
      /// If the SplashScreenController is registered, navigate to the HomeScreen.
      if (Get.isRegistered<SplashScreenController>()) {
        // Get.offAll(() => const HomeScreen());
        Get.back();
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
