import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/models/rover_data.dart';

abstract class RoverRepository {
  Future<RoverData> fetchImages(QueryModel queryModel);
}
