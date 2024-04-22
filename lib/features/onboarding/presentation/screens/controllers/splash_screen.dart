import 'package:flowtrack/features/onboarding/presentation/screens/controllers/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/storage/istorage.dart';
import '../contracts/splash_screen.dart';
import '../views/splash_screen.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';
  final dynamic param;
  const SplashScreen({Key? key, this.param}) : super(key: key);

  @override
  SplashScreenController createState() => SplashScreenController();
}

class SplashScreenController extends State<SplashScreen>
    implements SplashScreenControllerContract {
  late SplashScreenViewContract view;

  @override
  void initState() {
    checkOnboardingStatus();
    view = SplashScreenView(this);

    super.initState();
  }

  var storage = GetIt.I.get<CacheStorage>();

  void checkOnboardingStatus() async {
    Future.delayed(const Duration(seconds: 3));
    await storage.getOnboarding().then((value) {
      if (value ?? false) {
        context.push(SignInScreen.route);
      } else {
        context.go(OnboardingScreen.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
