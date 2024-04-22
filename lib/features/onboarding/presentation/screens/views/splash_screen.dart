import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../colors.dart';
import '../contracts/splash_screen.dart';

class SplashScreenView extends StatelessWidget
    implements SplashScreenViewContract {
  const SplashScreenView(this.controller, {super.key});
//final IWidgetHelper widgetHelper;
  final SplashScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              child: Image.asset(
                'assets/images/logo-no-background.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
