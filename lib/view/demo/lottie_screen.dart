import 'package:flutter/material.dart';
import 'package:flutter_mold_vault/controller/lottie_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LottieController lottieController = Get.put(LottieController());

    List<String> lottieList = [
      'assets/animations/success.json',
      'assets/animations/success1.json',
    ];
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: lottieList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Lottie.asset(
            lottieList[index],
            controller: lottieController.animationController,
            onLoaded: (composition) {
              // 애니메이션 실행 후 자동으로 종료
              lottieController.animationController.duration = composition.duration;
              lottieController.animationController.forward().then((_) {
                Get.back(); // Get을 사용해 이전 화면으로 돌아가기
              });
            },
          );
        },
      ),
    );
  }
}
