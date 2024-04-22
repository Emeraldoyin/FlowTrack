import 'package:flowtrack/features/onboarding/presentation/screens/controllers/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/data/models/onboard.dart';
import '../../../../../core/storage/istorage.dart';
import '../contracts/welcome_screen.dart';
import '../views/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String route = '/onboarding';
  final dynamic param;
  const OnboardingScreen({Key? key, this.param}) : super(key: key);

  @override
  OnboardingScreenController createState() => OnboardingScreenController();
}

class OnboardingScreenController extends State<OnboardingScreen>
    implements OnboardingScreenControllerContract {
  late OnboardingScreenViewContract view;

  @override
  void initState() {
    viewController = PageController();
    view = OnboardingScreenView(this);

    super.initState();
  }

  var storage = GetIt.I.get<CacheStorage>();

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  late PageController viewController;

  @override
  List<Onboard> details = [
    Onboard(
        description:
            'Order your food from any locatio you are.',
        title: 'Order',
        url: 'assets/images/courier1.png'),
    Onboard(
        description:
            'Track your delivery',
        title: 'Track',
        url: 'assets/images/courier2.png'),
    Onboard(
        description:
            'Enjoy your meal',
        title: 'Enjoy',
        url: 'assets/images/courier3.png')
  ];

  @override
  int value = 0;

  @override
  onPageChange(int currentIndex) {
    setState(() {
      value = currentIndex;
    });
  }

  @override
  void goToNext() {
    if (value <= 1) {
      setState(() {
        value++;
        viewController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      });
    } else {
       context.push(SignInScreen.route);
      storage.saveOnboarding(true);
    }
  }
}
