import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: const Text('Splash Widget'),
          onPressed: () => Get.offAll(
            () => const Center(
              child: Text('Splash Widget'),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
