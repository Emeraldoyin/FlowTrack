import 'package:flowtrack/features/onboarding/presentation/screens/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in_ios/google_sign_in_ios.dart';

import '../../../../../core/storage/istorage.dart';
import '../contracts/isign_in.dart';
import '../views/sign_in.dart';
import 'welcome_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String route = '/SignIn';
  final dynamic param;
  const SignInScreen({Key? key, this.param}) : super(key: key);

  @override
  SignInScreenController createState() => SignInScreenController();
}

class SignInScreenController extends State<SignInScreen>
    implements SignInScreenControllerContract {
  late SignInScreenViewContract view;

  @override
  void initState() {
    view = SignInScreenView(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  // final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;
        print(user!.displayName);
          print(user.email);
            print(user.phoneNumber);
             

        await _firebaseAuth.signInWithCredential(credential);
        if (mounted) {
          context.push(HomeScreen.route,extra: user);
        }
      }
    } catch (e) {
      print(e);
// showToast(message: "some error occured $e");
    }
  }
}
