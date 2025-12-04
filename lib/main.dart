import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jawam_ul_dua/presentation/ui/splash_screen.dart';
import 'package:jawam_ul_dua/router/app_routes.dart';
import 'package:jawam_ul_dua/theme.dart';
import 'package:jawam_ul_dua/utils/const/responsive_config.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig().init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "جوامع الدعاء",
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppGenerateRoute.generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}
