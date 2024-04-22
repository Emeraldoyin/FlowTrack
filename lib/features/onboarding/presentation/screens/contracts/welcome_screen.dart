
import 'package:flutter/material.dart';

import '../../../../../core/data/models/onboard.dart';

abstract class OnboardingScreenViewContract {
  Widget build(BuildContext context);
}

abstract class OnboardingScreenControllerContract {
late PageController viewController;
late List<Onboard> details;
late int value;
onPageChange(int value);

  void goToNext() {}
}
