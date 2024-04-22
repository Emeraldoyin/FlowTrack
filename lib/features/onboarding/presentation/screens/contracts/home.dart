import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';

import '../../../../../core/data/models/order.dart';

abstract class HomeScreenViewContract {
  Widget build(BuildContext context);
}

abstract class HomeScreenControllerContract {
  User? user;
  late List<Orders> orderList;

  void orderPage(Orders order);
}
