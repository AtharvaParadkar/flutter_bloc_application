import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/features/dashboard/UI/dashboard.dart';
import 'package:flutter_bloc_application/features/dashboard/UI/full_screen.dart';
import 'package:flutter_bloc_application/features/dashboard/UI/image_screen.dart';
import 'package:flutter_bloc_application/features/dashboard/UI/title_screen.dart';
import 'package:flutter_bloc_application/features/login_page/UI/login_page.dart';

import '../features/dashboard/model/photo_api_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteConstants.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case RouteConstants.dashboardScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, _) => const DashboardPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              slideTransition(context, animation, child),
        );
      case RouteConstants.titleScreen:
        if (args is PhotoApiModel) {
          final item = settings.arguments as PhotoApiModel;
          return PageRouteBuilder(
            pageBuilder: (context, animation, _) => TitleScreen(item: item),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    slideTransition(context, animation, child),
          );
        }
        return _errorRoute();
      case RouteConstants.imageScreen:
        if (args is PhotoApiModel) {
          final item = settings.arguments as PhotoApiModel;
          return PageRouteBuilder(
            pageBuilder: (context, animation, _) => ImageScreen(item: item),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    slideTransition(context, animation, child),
          );
        }
        return _errorRoute();
      case RouteConstants.fullscreen:
        if (args is PhotoApiModel) {
          final item = settings.arguments as PhotoApiModel;
          return MaterialPageRoute(
            builder: (_) => FullScreen(item: item),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      // const String routeName = '/ErrorRoute';
      return const Scaffold(
        body: Center(
          child: Text('Error'),
          // Text(StringConstants.errorOnNavigation),
        ),
      );
    });
  }
}

SlideTransition slideTransition(
    BuildContext context, Animation<double> animation, Widget child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.easeInOut;
  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
// Apply slide transition
    position: offsetAnimation,
    child: child,
  );
}

class RouteConstants {
  static const String loginScreen = '/';
  static const String dashboardScreen = '/Dashboard';
  static const String titleScreen = '/Title';
  static const String imageScreen = '/Image';
  static const String fullscreen = '/Fullscreen';
}
