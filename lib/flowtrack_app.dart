import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FlowTrackApp extends StatelessWidget {
  const FlowTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        // splitScreenMode: false,
        // scaleByHeight: true,
        rebuildFactor: (old, data) {
          return true;
        },
        builder: (context, child) => MaterialApp.router(
              title: "FlowTrack",
              debugShowCheckedModeBanner: false,
              //routerConfig: routeConfig,
              //theme: AppTheme.light,
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
