import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/models/rover_data.dart';

abstract class ShowImageState {}

class LoadingState extends ShowImageState {}

class FetchImageState extends ShowImageState {
  RoverData roverData;
  QueryModel queryModel;

  FetchImageState(this.roverData, [this.queryModel]);
}
