import 'package:another_stepper/another_stepper.dart';
import 'package:flowtrack/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../contracts/order.dart';

class OrderScreenView extends StatelessWidget
    implements OrderScreenViewContract {
  const OrderScreenView(this.controller, {super.key});
//final IWidgetHelper widgetHelper;
  final OrderScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order',
          style: TextStyle(fontSize: 26.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              controller.order!.item,
              style: TextStyle(fontSize: 22.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              controller.order!.price.toString(),
              style: TextStyle(fontSize: 22.sp),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: AnotherStepper(
                  stepperDirection: Axis.vertical,
                  stepperList: controller.stepperData,
                  activeIndex: controller.currentStepIndex,
                  barThickness: 8,
                  activeBarColor: Colors.green,
                  inActiveBarColor: Colors.grey,
                ),
              ),
            ),
            Visibility(
                visible: controller.currentStepIndex >= 3,
                child: Container(
                  child: Text(
                    'Congratulations, you have successfully completed your order',
                    style: TextStyle(
                        color: AppColor.green,
                        fontSize: 17.sp,
                        fontStyle: FontStyle.italic),
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Backend Simulation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            const Text(
                'ENter the title of the delivery status to simulate the order status'),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.sp,
              ),
              controller: controller.messageController,
              textInputAction: TextInputAction.next,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.publish();
                },
                child: const Text('Send Order Update'))
          ],
        ),
      ),
    );
  }
}
