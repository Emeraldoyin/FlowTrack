import 'package:another_stepper/dto/stepper_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowtrack/core/data/models/order.dart';
import 'package:flowtrack/features/onboarding/presentation/screens/controllers/order.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/storage/istorage.dart';
import '../contracts/home.dart';
import '../views/home.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/Home';
  final User user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  HomeScreenController createState() => HomeScreenController();
}

class HomeScreenController extends State<HomeScreen>
    implements HomeScreenControllerContract {
  late HomeScreenViewContract view;

  @override
  void initState() {
    view = HomeScreenView(this);
    if (mounted) {
      user = widget.user;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  User? user;

  @override
  void orderPage(Orders order) {
    context.push(OrderScreen.route, extra: order);
  }

  @override
  List<Orders> orderList = [
    Orders(
        price: 20, date: '', id: 1, item: 'Jollof rice and chicken', quatity: 1)
  ];
}
