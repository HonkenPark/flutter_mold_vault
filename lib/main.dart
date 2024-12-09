import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mold_vault/views/index_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  Get.put(MoldVaultController());

  runApp(MoldVaultApp());
}

class MoldVaultController extends GetxController {
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
            // fontFamily: 'FontFamilyName',
            // textTheme: const TextTheme(
            //   bodyLarge: TextStyle(fontFamily: 'FontFamilyName', fontWeight: FontWeight.w400),
            //   bodyMedium: TextStyle(fontFamily: 'FontFamilyName', fontWeight: FontWeight.w700),
            //   headlineLarge: TextStyle(fontFamily: 'FontFamilyNameOther', fontWeight: FontWeight.w700),
            // ),
            colorScheme: moldVaultController.isDarkMode ? const ColorScheme.dark(primary: Colors.indigo) : const ColorScheme.light(primary: Colors.indigo),
          ),
          title: 'Flutter Mold Vault',
          home: Scaffold(
            appBar: AppBar(
              title: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(moldVaultController.isDarkMode ? 'Set Light Mode' : 'Set Dark Mode'),
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
              child: IndexScreen(),
            ),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ko', 'KR'),
          ],
        ));
  }
}
