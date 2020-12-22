import 'package:mars_rover_image_flutter/models/rover_data.dart';

abstract class ShowImageState {}

class LoadingState extends ShowImageState {}

class FetchImageState extends ShowImageState {
  RoverData roverData;

  FetchImageState(this.roverData);
}
