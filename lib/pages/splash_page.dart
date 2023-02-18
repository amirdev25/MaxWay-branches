import 'package:flutter/material.dart';
import 'package:maxway_branches/core/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    goNextPage();
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(100.0),
          child: Image.asset("assets/images/app_logo.png"),
        ),
      ),
    );
  }

  void goNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.MAIN_PAGE,
        (route) => false,
      );
    });
  }
}
