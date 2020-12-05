import 'package:flutter/material.dart';
import 'package:mars_rover_image_flutter/rover_selection/select_rover.dart';

const String RoverSelectionRoute = "/";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoverSelectionRoute:
        return MaterialPageRoute(builder: (_) => SelectRover());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}