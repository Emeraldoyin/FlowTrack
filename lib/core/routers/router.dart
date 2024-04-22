import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowtrack/core/data/models/order.dart';
import 'package:flowtrack/features/onboarding/presentation/screens/controllers/order.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/presentation/screens/controllers/home.dart';
import '../../features/onboarding/presentation/screens/controllers/sign_in.dart';
import '../../features/onboarding/presentation/screens/controllers/splash_screen.dart';
import '../../features/onboarding/presentation/screens/controllers/welcome_screen.dart';

final rootScaffoldKey = GlobalKey<ScaffoldState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routeConfig = GoRouter(
    debugLogDiagnostics: true,
    //  initialLocation: LoginScreen.route,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: OnboardingScreen.route,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: HomeScreen.route,
        builder: (BuildContext context, GoRouterState state) {
          return  HomeScreen(user: state.extra as User,);
        },
      ),
      GoRoute(
        path: SignInScreen.route,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        },
      ),
        GoRoute(
        path: OrderScreen.route,
        builder: (BuildContext context, GoRouterState state) {
          return  OrderScreen(order: state.extra as Orders,);
        },
      ),
    ]);
