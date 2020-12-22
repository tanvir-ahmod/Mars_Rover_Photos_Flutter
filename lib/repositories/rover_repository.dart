import 'package:mars_rover_image_flutter/models/rover_data.dart';

abstract class RoverRepository {
  Future<RoverData> fetchImages();
}
