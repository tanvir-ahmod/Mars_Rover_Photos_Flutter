import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_image_flutter/models/rover.dart';

class RoverView extends StatelessWidget {
  final Rover _rover;

  RoverView(this._rover);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
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
                  Expanded(child: Text("Name")),
                  Expanded(child: Text(_rover.name))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Launch Date")),
                  Expanded(child: Text(_rover.launchDate))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Landing Date")),
                  Expanded(child: Text(_rover.landingDate))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Status")),
                  Expanded(child: Text(_rover.currentStatus))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
