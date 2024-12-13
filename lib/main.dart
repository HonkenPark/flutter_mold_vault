import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mold_vault/views/home_screen.dart';
import 'package:get/get.dart';

void main() async {
  /// Don't need to use Future.delayed() or Get.delayed() in main.dart.
  /// The main tasks in main.dart are to initialize the app and prepare it to run, because Future.delayed() is not required.
  /// main.dart is the part that handles the initialization tasks required before the app runs So it can be use WidgetsFlutterBinding.ensureInitialized().
  /// reference: https://docs.flutter.dev/development/ui/widgets-intro#main-function
  WidgetsFlutterBinding.ensureInitialized();

  /// API key or URL information are managed by env
  /// reference: https://pub.dev/packages/flutter_dotenv
  await dotenv.load(fileName: '.env');

  /// Put GetXController which need to be pre-loaded
  /// reference: https://pub.dev/packages/get#pre-loading-controllers
  Get.put(MoldVaultController());

  runApp(MoldVaultApp());
}

class MoldVaultController extends GetxController {
  /// Dark mode flag (true: dark mode, false: light mode)
  final RxBool _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;
  set isDarkMode(bool value) => _isDarkMode.value = value;
}

class MoldVaultApp extends StatelessWidget {
  MoldVaultApp({super.key});
  final MoldVaultController moldVaultController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            /// To apply the new font, please un-comment below.
            // fontFamily: 'FontFamilyName',
            // textTheme: const TextTheme(
            //   bodyLarge: TextStyle(fontFamily: 'FontFamilyName', fontWeight: FontWeight.w400),
            //   bodyMedium: TextStyle(fontFamily: 'FontFamilyName', fontWeight: FontWeight.w700),
            //   headlineLarge: TextStyle(fontFamily: 'FontFamilyNameOther', fontWeight: FontWeight.w700),
            // ),
            colorScheme: moldVaultController.isDarkMode ? const ColorScheme.dark(primary: Colors.lime) : const ColorScheme.light(primary: Colors.lime),
          ),
          title: 'Flutter Mold Vault',
          home: Scaffold(
            appBar: AppBar(
              title: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(moldVaultController.isDarkMode ? 'Dark mode On' : 'Dark mode Off'),
                      Switch(
                        value: moldVaultController.isDarkMode,
                        onChanged: (value) {
                          moldVaultController.isDarkMode = value;
                        },
                      ),
                    ],
                  )),
            ),
            body: const Center(
              child: HomeScreen(),
            ),
          ),

          /// Provides localization support
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          /// Support location
          supportedLocales: const [
            Locale('en'),
            Locale('ko', 'KR'),
          ],
        ));
  }
}
