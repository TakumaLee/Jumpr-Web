import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'routes.dart';
import 'screens/download_page.dart';
import 'screens/home_page.dart';
import 'utils/theme_data.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jumpr - Virtual Jump Rope & Free Fitness',
      theme: lightThemeData,
      // darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: HomePage(),
      navigatorKey: Routes.rootNavigatorKey,
      initialRoute: Routes.PAGE_INITIAL,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }

}
