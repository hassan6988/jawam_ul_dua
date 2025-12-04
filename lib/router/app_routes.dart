import 'package:flutter/cupertino.dart';
import 'package:jawam_ul_dua/presentation/ui/name_details_screen.dart';

import '../presentation/ui/about_author.dart';
import '../presentation/ui/about_screen.dart';
import '../presentation/ui/privacy_policy.dart';
import '../presentation/ui/splash_screen.dart';

class AppGenerateRoute {
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.nameDetailsScreen:
        final args = setting.arguments;
        return _navigateScreen(NameDetailsScreen(arguments: args));
      case RouteName.aboutScreen:
        return _navigateScreen(const AboutScreen());
      case RouteName.privacyPolicy:
        return _navigateScreen(const PrivacyPolicyScreen());
      case RouteName.aboutAuthor:
        return _navigateScreen(const AboutAuthorScreen());
      default:
        return _navigateScreen(const SplashScreen());
    }
  }

  static PageRouteBuilder _navigateScreen(Widget screen) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return customLeftSlideTransition(animation, child);
      },
    );
  }

  static Widget customLeftSlideTransition(
    Animation<double> animation,
    Widget child,
  ) {
    Tween<Offset> tween = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    );
    return SlideTransition(position: tween.animate(animation), child: child);
  }
}

class RouteName {
  static const splash = "/splash";
  static const homeScreen = "/homeScreen";
  static const nameDetailsScreen = "/name_details_screen";
  static const aboutScreen = "/about_screen";
  static const privacyPolicy = "/privacy_policy";
  static const aboutAuthor = "/about_author";
}
