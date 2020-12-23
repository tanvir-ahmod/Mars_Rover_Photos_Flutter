import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/rover_selection/rover_selection_event.dart';
import 'package:mars_rover_image_flutter/bloc/rover_selection/rover_selection_state.dart';
import 'package:mars_rover_image_flutter/data/repositories/rover_repository.dart';

class RoverSelectionBloc
    extends Bloc<RoverSelectionEvent, RoverSelectionState> {
  final RoverRepository _roverRepository;

  RoverSelectionBloc(this._roverRepository) : super(null);

  @override
  Stream<RoverSelectionState> mapEventToState(
      RoverSelectionEvent event) async* {
    if (event is FetchRoverEvent) {
      var roverData = _roverRepository.fetchRovers();
      // print('ok ${roverData.length}');
      yield FetchRoverState(roverData);
    }
  }
}
