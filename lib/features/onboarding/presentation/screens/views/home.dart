import 'package:flowtrack/features/onboarding/presentation/screens/controllers/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/data/models/order.dart';
import '../contracts/home.dart';

class HomeScreenView extends StatelessWidget implements HomeScreenViewContract {
  const HomeScreenView(this.controller, {super.key});
//final IWidgetHelper widgetHelper;
  final HomeScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'User Profile',
                  style: TextStyle(color: Colors.white),
                )),
            ListTile(
              title: Text('Name: ${controller.user!.displayName}'),
            ),
            ListTile(
              title: Text('Email: ${controller.user!.email}'),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  context.go(SignInScreen.route);
                },
                child: const Text('Logout'))
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text('Hi, '),
                      Text(controller.user!.displayName ?? '')
                    ],
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: CircleAvatar(
                        radius: 15,
                        child: Text(controller.user!.email!.substring(0, 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Orders',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 300.h,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {
                              controller.orderPage(controller.orderList[index]);
                            },
                            child: OrdersWidget(
                                order: controller.orderList[index]),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersWidget extends StatelessWidget {
  final Orders order;
  const OrdersWidget({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.item,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${order.price.toString()}',
                        style: TextStyle(
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        'x${order.quatity.toString()}',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
