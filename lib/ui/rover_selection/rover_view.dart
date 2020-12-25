import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_image_flutter/models/rover.dart';

class RoverView extends StatelessWidget {
  final Rover _rover;

  RoverView(this._rover);

  TextStyle _titleTextStyle = TextStyle(fontSize: 18);
  TextStyle _subTitleTextStyle = TextStyle(fontSize: 16, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    Color statusTextColor = _rover.currentStatus.toLowerCase() == "active"
        ? Colors.green
        : Colors.redAccent;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(_rover.image, height: 300, fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Name", style: _titleTextStyle)),
                    Expanded(child: Text(_rover.name, style: _subTitleTextStyle))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Launch Date", style: _titleTextStyle)),
                    Expanded(
                        child: Text(_rover.launchDate, style: _subTitleTextStyle))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Landing Date",
                      style: _titleTextStyle,
                    )),
                    Expanded(
                        child:
                            Text(_rover.landingDate, style: _subTitleTextStyle))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Status", style: _titleTextStyle)),
                    Expanded(
                        child: Text(_rover.currentStatus,
                            style:
                                TextStyle(fontSize: 16, color: statusTextColor)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
