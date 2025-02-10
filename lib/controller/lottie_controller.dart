import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LottieController extends GetxController with GetTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
