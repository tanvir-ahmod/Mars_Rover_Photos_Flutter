import 'package:mars_rover_image_flutter/models/query_model.dart';

abstract class ShowImageEvent {}

class LoadingEvent extends ShowImageEvent {}

class FetchImageEvent extends ShowImageEvent {
  QueryModel queryModel;

  FetchImageEvent(this.queryModel);
}

class FilterEvent extends ShowImageEvent {
  QueryModel queryModel;

  FilterEvent(this.queryModel);
}
