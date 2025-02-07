import 'package:flutter/material.dart';
import 'package:flutter_mold_vault/controller/base_controller.dart';
import 'package:flutter_mold_vault/widget/footer/footer_info_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_mold_vault/config/theme/app_colors.dart';
import 'package:flutter_mold_vault/config/theme/app_spacing.dart';
import 'package:flutter_mold_vault/config/theme/app_text_styles.dart';
import 'package:flutter_mold_vault/controller/login_controller.dart';

class LoginLogoScreen extends StatelessWidget {
  const LoginLogoScreen({super.key});

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
      backgroundColor: AppColors.iqonicIvory,
      appBar: AppBar(
        backgroundColor: AppColors.iqonicIvory,
        centerTitle: false,
        title: Image.asset(
          'assets/images/fmv_logo_600x600.png',
          // color: AppColors.burntRose,
          height: 24,
        ),
      ),
      bottomNavigationBar: const FooterWidget(isLoginScreen: true),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  128.0,
                ),
                child: Image.asset(
                  'assets/images/fmv_logo_600x600.png',
                  // color: AppColors.burntRose,
                  height: 240,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 84.0, // Footer Size
                ),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 420, maxHeight: 340),
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.defaultWhite,
                    borderRadius: BorderRadius.circular(AppSpacing.md),
                    border: Border.all(
                      color: AppColors.oceanBlue,
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.oceanBlue,
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
                      ],
                    ),
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
