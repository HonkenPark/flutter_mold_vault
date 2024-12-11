import 'package:flutter/material.dart';
import 'package:flutter_mold_vault/views/demo/splash_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
