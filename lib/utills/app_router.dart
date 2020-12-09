import 'package:flutter/material.dart';
import 'package:mars_rover_image_flutter/rover_selection/select_rover.dart';
import 'package:mars_rover_image_flutter/show_image/show_rover_images.dart';

const String RoverSelectionRoute = "/";
const String ShowImageRoute = "/show_images";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoverSelectionRoute:
        return MaterialPageRoute(builder: (_) => SelectRover());
      case ShowImageRoute:
        return MaterialPageRoute(builder: (_) => ShowRoverImages());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}