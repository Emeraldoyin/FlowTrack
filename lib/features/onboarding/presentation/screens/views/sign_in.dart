import 'package:flutter/material.dart';

import '../contracts/isign_in.dart';

class SignInScreenView extends StatelessWidget
    implements SignInScreenViewContract {
  const SignInScreenView(this.controller, {super.key});
//final IWidgetHelper widgetHelper;
  final SignInScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/google.png',fit: BoxFit.contain,),
          InkWell(
              onTap: () {
                controller.signInWithGoogle();
              },
              child: const Text(
                'Login with Google',
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
