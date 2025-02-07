import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_mold_vault/config/theme/app_colors.dart';
import 'package:flutter_mold_vault/config/enums.dart';
import 'package:flutter_mold_vault/util/encrypt_util.dart';
import 'package:flutter_mold_vault/util/storage_util.dart';
import 'package:flutter_mold_vault/widget/snackbar/snackbar_widget.dart';

class LoginController extends GetxController {
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxBool _isBtnLoading = false.obs;
  bool get isBtnLoading => _isBtnLoading.value;
  set isBtnLoading(bool value) => _isBtnLoading.value = value;

  final _btnColor = AppColors.mediumGray.obs;
  Color get btnColor => _btnColor.value;
  set btnColor(Color value) => _btnColor.value = value;

  final _idBoxBorderColor = AppColors.neutralGray.obs;
  Color get idBoxBorderColor => _idBoxBorderColor.value;
  set idBoxBorderColor(Color value) => _idBoxBorderColor.value = value;

  final _pwBoxBorderColor = AppColors.neutralGray.obs;
  Color get pwBoxBorderColor => _pwBoxBorderColor.value;
  set pwBoxBorderColor(Color value) => _pwBoxBorderColor.value = value;

  final RxDouble _idBoxBorderWidth = 1.0.obs;
  double get idBoxBorderWidth => _idBoxBorderWidth.value;
  set idBoxBorderWidth(double value) => _idBoxBorderWidth.value = value;

  final RxDouble _pwBoxBorderWidth = 1.0.obs;
  double get pwBoxBorderWidth => _pwBoxBorderWidth.value;
  set pwBoxBorderWidth(double value) => _pwBoxBorderWidth.value = value;

  final RxString _serverVer = '0.0.0'.obs;
  String get serverVer => _serverVer.value;
  set serverVer(String value) => _serverVer.value = value;

  final RxBool _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;
  set isPasswordVisible(bool value) => _isPasswordVisible.value = value;
  void togglePasswordVisible() => _isPasswordVisible.value = !_isPasswordVisible.value;

  final RxBool _isSavedIdChecked = true.obs;
  bool get isSavedIdChecked => _isSavedIdChecked.value;
  set isSavedIdChecked(bool value) => _isSavedIdChecked.value = value;

  final RxString _savedId = ''.obs;
  String get savedId => _savedId.value;
  set savedId(String value) => _savedId.value = value;

  final RxString _savedPw = ''.obs;
  String get savedPw => _savedPw.value;
  set savedPw(String value) => _savedPw.value = value;

  final RxBool _isAutoLogin = false.obs;
  bool get isAutoLogin => _isAutoLogin.value;
  set isAutoLogin(bool value) => _isAutoLogin.value = value;

  String getIsSavedId() {
    String? isSavedId = fetchStorage('isSavedId');
    if (isSavedId != null && isSavedId.isNotEmpty) {
      String id = fetchStorage('id') ?? '';
      savedId = decryptInfo(id);
      isSavedIdChecked = true;
    } else {
      savedId = '';
      isSavedIdChecked = false;
    }
    return savedId;
  }

  String getIsAutoLogin() {
    String? autoLogin = fetchStorage('isAutoLogin');
    if (autoLogin != null && autoLogin.isNotEmpty) {
      String pw = fetchStorage('pw') ?? '';
      savedPw = decryptInfo(pw);
      isAutoLogin = true;
    } else {
      savedId = '';
      isAutoLogin = false;
    }
    return savedPw;
  }
}
