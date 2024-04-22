import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/order.dart';

abstract class OrderScreenViewContract {
  Widget build(BuildContext context);
}

abstract class OrderScreenControllerContract {
  late List<StepperData> stepperData;
  late List<String> deliverySteps;
  late int currentStepIndex = 0;
  void publish();
  Orders? order;
  late TextEditingController nameController;
  late TextEditingController messageController;
}
