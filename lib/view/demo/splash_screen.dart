import 'package:flutter/material.dart';
import 'package:flutter_mold_vault/widget/splash/splash_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: splashScreenController.animationController,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey,
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.grey.shade100,
                Colors.grey.shade300,
                Colors.grey,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                /// Using below instead of [MediaQuery.of(context).size.height]
                /// 1. MediaQuery.of (context) uses InheritedWidget, which can cause unexpected behavior if the context is used in certain widgets as it descends to a deeper tree.
                /// 2. sizeOf (context) optimizes this to calculate screen size faster and more efficiently.
                height: MediaQuery.sizeOf(context).height / 8,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fmv_logo_600x600.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
