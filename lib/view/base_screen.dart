import 'package:flutter/material.dart';
import 'package:flutter_mold_vault/view/demo/splash_screen.dart';
import 'package:get/get.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// When switching between screens using GetX, it is common to wrap the widget with Scaffold even on a new screen.
    /// Scaffold provides the basic layout structure of the Flutter, so you can use it on a per-screen basis.
    /// This is a demo screen for testing the functionality of the project.
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Splash Screen Demo'),
              // onPressed: () => Get.offAll(
              //   () => SplashScreen(),
              // ),
              // onPressed: () => Get.toNamed('/splash'),
              onPressed: () => Get.to(() => SplashScreen()),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Login Screen Demo'),
              // onPressed: () => Get.offAll(
              //   () => SplashScreen(),
              // ),
              // onPressed: () => Get.toNamed('/splash'),
              onPressed: () => Get.to(() => SplashScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
