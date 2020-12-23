import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_event.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_state.dart';
import 'package:mars_rover_image_flutter/data/repositories/rover_repository.dart';

class ShowImageBloc extends Bloc<ShowImageEvent, ShowImageState> {
  final RoverRepository _roverRepository;

  ShowImageBloc(this._roverRepository) : super(null);

  @override
  Stream<ShowImageState> mapEventToState(ShowImageEvent event) async* {
    if (event is LoadingEvent) {
      yield LoadingState();
    } else if (event is FetchImageEvent) {
      yield LoadingState();
      var roverData = await _roverRepository.fetchImages(event.queryModel);
      yield FetchImageState(roverData, event.queryModel);
    }
  }
}
