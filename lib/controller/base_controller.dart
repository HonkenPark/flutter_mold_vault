// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_mold_vault/config/theme/app_colors.dart';
// import 'package:flutter_mold_vault/config/enums.dart';
import 'package:flutter_mold_vault/util/encrypt_util.dart';
import 'package:flutter_mold_vault/util/storage_util.dart';

class BaseController extends GetxController {
  /// Project Name
  final RxString _projectName = const String.fromEnvironment('PROJECT').isEmpty ? 'ALL'.obs : const String.fromEnvironment('PROJECT').obs;
  String get projectName => _projectName.value;
  set projectName(String value) => _projectName.value = value;

  /// User ID
  final RxString _userId = ''.obs;
  String get userId => _userId.value;
  set userId(String value) => _userId.value = value;

  /// Index for Navigation Rail & Bottom Navigation Bar
  final RxInt selectedIndex = 0.obs;
  set changeIndex(int value) => selectedIndex.value = value;

  /// For Skip Login Screen
  void initializeScreen() {
    String? token = fetchStorage('token');
    String id = fetchStorage('id') ?? '';
    userId = decryptInfo(id);
    if (token == null || userId.isEmpty) {
      Get.offAllNamed('/');
    }
  }

  // List<BottomNavigationBarItem> get availableBottomMenus => PageScreenType.values
  //     .where((e) => e != PageScreenType.setting || isAdmin())
  //     .map((e) => BottomNavigationBarItem(
  //           icon: Icon(e.icon, color: AppColors.neutralGray),
  //           activeIcon: Icon(e.icon, color: AppColors.defaultWhite),
  //           backgroundColor: AppColors.urbanGray,
  //           label: e.name,
  //         ))
  //     .toList();

  // List<NavigationRailDestination> get availableMenus => PageScreenType.values
  //     .where((e) => e != PageScreenType.setting || isAdmin())
  //     .map((e) => NavigationRailDestination(
  //           icon: Icon(e.icon, color: AppColors.defaultBlack),
  //           selectedIcon: Icon(e.icon, color: AppColors.defaultWhite),
  //           label: Text(
  //             e.name,
  //             style: TextStyle(color: AppColors.urbanGray, fontWeight: FontWeight.bold),
  //           ),
  //         ))
  //     .toList();
}
