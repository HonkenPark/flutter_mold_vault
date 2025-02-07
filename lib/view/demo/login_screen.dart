import 'package:flutter/material.dart';
import 'package:flutter_mold_vault/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_mold_vault/config/theme/app_colors.dart';
import 'package:flutter_mold_vault/config/theme/app_spacing.dart';
import 'package:flutter_mold_vault/config/theme/app_text_styles.dart';
import 'package:flutter_mold_vault/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final baseController = Get.find<BaseController>();
    final loginController = Get.find<LoginController>();
    final formKey = GlobalKey<FormState>();
    final idController = TextEditingController();
    final pwController = TextEditingController();

    baseController.projectName = const String.fromEnvironment('PROJECT').isEmpty ? 'Default' : const String.fromEnvironment('PROJECT');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      idController.text = loginController.getIsSavedId();
      pwController.text = loginController.getIsAutoLogin();
    });

    return Scaffold(
      backgroundColor: AppColors.coolSlateBlue,
      appBar: AppBar(
        backgroundColor: AppColors.coolSlateBlue,
        centerTitle: false,
        title: Image.asset(
          'assets/images/fmv_logo_600x600.png',
          // color: AppColors.iqonicIvory,
          height: 24,
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 360, maxHeight: 460),
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.iqonicIvory,
            borderRadius: BorderRadius.circular(AppSpacing.md),
            border: Border.all(
              color: AppColors.defaultWhite,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.defaultWhite,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  '로그인 화면',
                  style: AppTextStyles.loginTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xl),
                Obx(() => TextFormField(
                      controller: idController,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: '아이디',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: loginController.idBoxBorderColor,
                            width: loginController.idBoxBorderWidth,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '아이디를 입력해주세요';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          baseController.userId = idController.text;
                          // loginController.handleLogin(value, pwController.text);
                        }
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty && pwController.text.isNotEmpty) {
                          loginController.btnColor = AppColors.oceanBlue;
                        } else {
                          loginController.btnColor = AppColors.mediumGray;
                        }
                      },
                    )),
                const SizedBox(height: AppSpacing.md),
                Obx(() => TextFormField(
                      controller: pwController,
                      obscureText: !loginController.isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: '비밀번호',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: loginController.pwBoxBorderColor,
                            width: loginController.pwBoxBorderWidth,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: loginController.togglePasswordVisible,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력해주세요';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          baseController.userId = idController.text;
                          // loginController.handleLogin(idController.text, value);
                        }
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty && idController.text.isNotEmpty) {
                          loginController.btnColor = AppColors.oceanBlue;
                        } else {
                          loginController.btnColor = AppColors.mediumGray;
                        }
                      },
                    )),
                const SizedBox(height: AppSpacing.sm),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  // padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: loginController.isSavedIdChecked,
                                onChanged: (value) {
                                  loginController.isSavedIdChecked = value ?? false;
                                  if (loginController.isSavedIdChecked == false) {
                                    loginController.isAutoLogin = false;
                                  }
                                },
                              )),
                          const Text('아이디 저장'),
                        ],
                      ),
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: loginController.isAutoLogin,
                                onChanged: (value) {
                                  loginController.isAutoLogin = value ?? false;
                                  if (loginController.isAutoLogin == true) {
                                    loginController.isSavedIdChecked = true;
                                  } else {}
                                },
                              )),
                          const Text('자동 로그인'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Obx(() => ElevatedButton(
                      onPressed: loginController.isBtnLoading
                          ? null
                          : () async {
                              if (formKey.currentState!.validate()) {
                                baseController.userId = idController.text;
                                // await loginController.handleLogin(
                                //   idController.text,
                                //   pwController.text,
                                // );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: loginController.btnColor,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.sm),
                        ),
                      ),
                      child: loginController.isBtnLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.defaultWhite,
                              ),
                            )
                          : const Text(
                              '로그인',
                              style: TextStyle(
                                color: AppColors.defaultWhite,
                                fontSize: 16,
                              ),
                            ),
                    )),
                const SizedBox(height: AppSpacing.xl),
                Obx(() => Text(
                      'Server Version: ${loginController.serverVer} | App Version: 1.0,0',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.mediumGray,
                        fontSize: 12,
                      ),
                    )),
                Obx(() => Text(
                      'Project: ${baseController.projectName}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.mediumGray,
                        fontSize: 12,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
