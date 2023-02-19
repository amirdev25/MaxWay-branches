import 'package:flutter/material.dart';
import 'package:maxway_branches/core/theme/app_colors.dart';
import 'package:maxway_branches/core/utils/constants.dart';
import 'package:maxway_branches/pages/main_page.dart';
import 'package:maxway_branches/pages/main_provider.dart';
import 'package:maxway_branches/pages/map_page.dart';
import 'package:maxway_branches/pages/splash_page.dart';
import 'package:provider/provider.dart';

import 'data/di.dart';

void main() {
  setupDI();
  runApp(const MaxWayApp());
}

class MaxWayApp extends StatelessWidget {
  const MaxWayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.mainColor,
      ),
      initialRoute: Routes.SPALSH_PAGE,
      routes: {
        Routes.SPALSH_PAGE: (context) => SplashPage(),
        Routes.MAP_PAGE: (context) => MapPage(),
        Routes.MAIN_PAGE: (context) {
          return ChangeNotifierProvider(
            create: (context) => MainProvider(),
            child: const MainPage(),
          );
        },
      },
    );
  }
}
