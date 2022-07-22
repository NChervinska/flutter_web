import 'package:flutter/material.dart';

import 'constant/app_color.dart';
import 'constant/app_strings.dart';
import 'pages/home_page.dart';

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);
  ThemeData get _getTheme {
    return ThemeData(
      primaryColor: AppColor.blue,
      scaffoldBackgroundColor: AppColor.lightBlue,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: AppColor.blue),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: _getTheme,
      home: HomePage(),
    );
  }
}
