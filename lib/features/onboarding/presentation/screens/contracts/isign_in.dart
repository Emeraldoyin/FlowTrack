import 'package:flutter/material.dart';

abstract class SignInScreenViewContract {
  Widget build(BuildContext context);
}

abstract class SignInScreenControllerContract {
  signInWithGoogle();
}
