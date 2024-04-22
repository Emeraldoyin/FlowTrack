
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'config/app_initializer.dart';
import 'core/routers/router.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
    await AppInitializer.initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        // splitScreenMode: false,
        // scaleByHeight: true,
        rebuildFactor: (old, data) {
          return true;
        },
        builder: (context, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: routeConfig,
          //   theme: AppTheme.light,
              // darkTheme: AppTheme.dark,
              themeMode: ThemeMode.light,
    
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                ],
              ),
            ));
  }
}


