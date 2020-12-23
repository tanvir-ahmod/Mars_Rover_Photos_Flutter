import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_event.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_state.dart';
import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/models/rover.dart';
import 'package:mars_rover_image_flutter/models/rover_camera.dart';

import 'camera_view.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  Rover _rover;
  QueryModel _queryModel;

  CustomAppBar(
    this._rover, {
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 370,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Date")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.date_range),
                          color: Colors.green,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Camera")),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        BlocProvider.of<ShowImageBloc>(context)
                            .add(FetchAvailableCamerasEvent(_rover.id));
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<ShowImageBloc, ShowImageState>(
                    builder: (context, state) {
                  if (state is FetchAvailableCamerasState) {
                    print(state.availableCameras.length);
                    return _showAvailableCameras(
                        context, state.availableCameras);
                  }
                  return Container();
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _appBar(BuildContext context, String label) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
                color: Colors.black,
              ),
              Chip(
                onDeleted: () {},
                label: Text(label),
              ),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  IconButton(
                    icon: Icon(Icons.tune),
                    onPressed: () => _showFilterBottomSheet(context),
                    color: Colors.black,
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _showAvailableCameras(
      BuildContext context, List<RoverCamera> availableCameras) {
    return GridView.builder(
      itemCount: availableCameras.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return CameraView(
            availableCameras[index].image, availableCameras[index].name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowImageBloc, ShowImageState>(
        builder: (context, state) {
      if (state is FetchImageState) {
        _queryModel = state.queryModel;
        return _appBar(
            context,
            state.queryModel?.earthDate == null
                ? "No Filter"
                : state.queryModel.earthDate);
      }
      return _appBar(context, "No Filter");
    });
  }
}
