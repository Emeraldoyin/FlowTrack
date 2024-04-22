import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../colors.dart';
import '../contracts/welcome_screen.dart';

class OnboardingScreenView extends StatelessWidget implements OnboardingScreenViewContract {
  const OnboardingScreenView(this.controller, {super.key});
//final IWidgetHelper widgetHelper;
  final OnboardingScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body:PageView.builder(
         scrollDirection: Axis.horizontal,
        controller:controller.viewController ,
        itemCount: controller.details.length,
        onPageChanged: (value)=> controller.onPageChange(value),
        itemBuilder: (ctx, index){
        return Stack(
          children: [
            SizedBox(
              child: Image.asset(controller.details[index].url),
            )
            ,
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                decoration: BoxDecoration(color: AppColor.backGround, borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
                height: 253.h,
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(child: Text(controller.details[index].title, style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w700,),)),
                    SizedBox(
                      height: 10.h,
                    ),
                 Expanded(child:  Text(controller.details[index].description, style: TextStyle(color: Colors.white,),textAlign: TextAlign.justify,)),
              InkWell(
                onTap: (){
        controller.goToNext();
                },
                child: Padding(padding: EdgeInsets.only(bottom: 20.h), child: Container(
                  height: 45.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: AppColor.button, borderRadius: BorderRadius.circular(10.r)),
                  child: Center(child:
                   Text(controller.value !=2 ? 'Next' : 'Get Started', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColor.white),)),
                ),),
              )
                  ],
                ),
              ),
            )
          ],
        );
      })
    );
  }
}