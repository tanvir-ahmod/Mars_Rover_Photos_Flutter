import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/models/rover.dart';
import 'package:mars_rover_image_flutter/models/rover_camera.dart';
import 'package:mars_rover_image_flutter/models/rover_data.dart';

abstract class RoverRepository {
  List<Rover> fetchRovers();

  List<RoverCamera> fetchAvailableCameraById(int id);

  Future<RoverData> fetchImages(QueryModel queryModel);
}
