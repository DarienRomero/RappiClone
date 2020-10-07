import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'views/views.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final splash = SplashView();
    final home = HomeView();

    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (_) => splash);
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => home);
      case RoutePaths.LoginScreen:
        return MaterialPageRoute(builder: (_) => LoginView());

      default:
        final List<String> path = settings.name.split('/');
        if (path[0] != '') return null;

        // Detail screen
        // if (isPathNameWithRoute(settings, RoutePaths.ProductDetail)) {
        //   String _id = getIdByPath(settings);
        //   return MaterialPageRoute(
        //       builder: (_) => FlagDetailScreen(flagId: _id));
        // }
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }

  static bool isPathNameWithRoute(RouteSettings settings, String pathName) {
    final List<String> path = settings.name.split('/');
    final List<String> pathScreen = pathName.split('/');
    if (path[0] != '' || pathScreen[0] != '') return false;
    if (path[1].startsWith(pathScreen[1])) {
      if (path.length != 3) return false;
      return true;
    }
    return false;
  }

  static String getIdByPath(RouteSettings settings) {
    final List<String> path = settings.name.split('/');
    if (path[0] != '' || path.length != 3) return null;
    final List<String> id = path[2].split('#');
    return id[0];
  }

  /// Ejemplo de llamada para un tab en específico:
  /// /{routeName}/{id}#{initialTabIndex}
  /// example:
  ///     /screen/ID0001#1
  static int getTabByPath(RouteSettings settings) {
    final List<String> path = settings.name.split('#');
    return path[1] != "null" ? int.parse(path.last) : 0;
  }
}
