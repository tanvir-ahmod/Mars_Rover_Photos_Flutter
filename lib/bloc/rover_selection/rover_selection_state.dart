import 'package:mars_rover_image_flutter/models/rover.dart';

abstract class RoverSelectionState {}

class FetchRoverState extends RoverSelectionState {
  List<Rover> rovers;

  FetchRoverState(this.rovers);
}
