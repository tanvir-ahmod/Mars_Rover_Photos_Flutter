import 'dart:ui';

import 'package:flutter/material.dart';

import 'camera_view.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
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
                padding: EdgeInsets.all(8.0),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text("Camera")),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CameraView("assets/images/curiosity_fhaz.webp", "FHAZ"),
                      CameraView("assets/images/curiosity_rhaz.jpg", "RHAZ"),
                      CameraView("assets/images/curiosity_mast.webp", "MAST"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CameraView(
                          "assets/images/curiosity_chemcam.jpg", "CHEMCAM"),
                      CameraView(
                          "assets/images/opportunity_navcam.jpg", "NAVCAM"),
                      SizedBox(
                        width: 120,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                label: Text('No Filter'),
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
}
