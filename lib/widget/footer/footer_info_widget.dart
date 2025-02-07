import 'package:flutter/material.dart';
import 'package:flutter_mold_vault/config/theme/app_colors.dart';
import 'package:flutter_mold_vault/config/theme/app_spacing.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
    required this.isLoginScreen,
  });
  final bool isLoginScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLoginScreen ? 80 : 84,
      color: AppColors.indigoNight,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: isLoginScreen ? AppSpacing.md : AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
            ),
            child: Image.asset(
              'assets/images/fmv_logo_600x600.png',
              height: 32.0,
            ),
          ),
          Row(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '서울 강남구 테헤란로 152 강남파이낸스센터',
                    style: TextStyle(
                      color: AppColors.iqonicIvory,
                      fontSize: 11.0,
                    ),
                  ),
                  Text(
                    '대표전화: 02-531-9000  대표메일: google_korea@gmail.com',
                    style: TextStyle(
                      color: AppColors.iqonicIvory,
                      fontSize: 11.0,
                    ),
                  ),
                  Text(
                    ' Copyright © 2025 Company All rights reserved.',
                    style: TextStyle(
                      color: AppColors.iqonicIvory,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
              SizedBox(width: isLoginScreen ? 0 : 40),
              if (!isLoginScreen)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'UBCN 결제내역 https://vmms.ubcn.co.kr/web/src/main.jsp',
                      style: TextStyle(
                        color: AppColors.iqonicIvory,
                        fontSize: 11.0,
                      ),
                    ),
                    Text(
                      'KIS 결제내역 https://semplus.kisvan.co.kr/',
                      style: TextStyle(
                        color: AppColors.iqonicIvory,
                        fontSize: 11.0,
                      ),
                    ),
                    Text(
                      '코세스 결제내역 https://store.kocespay.com/login.go',
                      style: TextStyle(
                        color: AppColors.iqonicIvory,
                        fontSize: 11.0,
                      ),
                    ),
                    Text(
                      '코세스 매입취소 https://kcs.koces.com',
                      style: TextStyle(
                        color: AppColors.iqonicIvory,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
