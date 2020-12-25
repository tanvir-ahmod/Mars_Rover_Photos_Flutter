import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_event.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_state.dart';
import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/models/rover.dart';
import 'package:mars_rover_image_flutter/models/rover_camera.dart';

import 'camera_view.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  Rover _rover;

  CustomAppBar(
    this._rover, {
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  QueryModel _queryModel;
  List<RoverCamera> availableCameras = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    BlocProvider.of<ShowImageBloc>(context)
        .add(FetchAvailableCamerasEvent(widget._rover.id));
    super.initState();
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 370,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Date",
                      style: TextStyle(fontSize: 18),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => _selectDate(context),
                          icon: Icon(
                            Icons.date_range,
                            size: 34,
                          ),
                          color: Colors.green,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text("Camera", style: TextStyle(fontSize: 18))),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        _queryModel.camera = null;
                        BlocProvider.of<ShowImageBloc>(context)
                            .add(FetchImageEvent(_queryModel));
                        Navigator.pop(context);
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
              Expanded(child: _showAvailableCameras(context, availableCameras)),
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
                onDeleted: () {
                  _queryModel.earthDate = null;
                  BlocProvider.of<ShowImageBloc>(context)
                      .add(FetchImageEvent(_queryModel));
                },
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
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            _queryModel.camera = availableCameras[index].name;
            BlocProvider.of<ShowImageBloc>(context)
                .add(FetchImageEvent(_queryModel));
          },
          child: CameraView(
              availableCameras[index].image, availableCameras[index].name),
        );
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
            _queryModel.earthDate == null
                ? "No Filter"
                : _queryModel.earthDate);
      }

      if (state is FetchAvailableCamerasState) {
        availableCameras = state.availableCameras;
      }

      return _appBar(context,
          _queryModel.earthDate == null ? "No Filter" : _queryModel.earthDate);
    });
  }

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      _queryModel.earthDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedDate = picked;
      BlocProvider.of<ShowImageBloc>(context).add(FetchImageEvent(_queryModel));
      Navigator.pop(context);
    }
  }
}
