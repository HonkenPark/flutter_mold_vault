import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MoldVaultApp());
}

class MoldVaultApp extends StatelessWidget {
  const MoldVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: 'FontFamilyName',
      //   textTheme: const TextTheme(
      //     bodyLarge: TextStyle(fontFamily: 'FontFamilyName', fontWeight: FontWeight.w400),
      //     bodyMedium: TextStyle(fontFamily: 'FontFamilyName', fontWeight: FontWeight.w700),
      //     headlineLarge: TextStyle(fontFamily: 'FontFamilyNameOther', fontWeight: FontWeight.w700),
      //   ),
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      // ),
      title: 'Flutter Mold Vault',
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ko', 'KR'),
      ],
    );
  }
}
