import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_image_flutter/rover_selection/rover.dart';

class RoverView extends StatelessWidget {
  int position;

  RoverView(this.position);

  var rovers = [
    Rover(
        image: "assets/images/curiosity.webp",
        name: "Curiosity",
        launchDate: "2011-11-26",
        landingDate: "2012-08-06",
        currentStatus: "Active"),
    Rover(
        image: "assets/images/opportunity.webp",
        name: "Opportunity",
        launchDate: "2003-07-07",
        landingDate: "2004-01-25",
        currentStatus: "Complete"),
    Rover(
        image: "assets/images/spirit.webp",
        name: "Spirit",
        launchDate: "2003-06-10",
        landingDate: "2004-01-04",
        currentStatus: "Complete"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(rovers[position].image,
                  height: 300, fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Name")),
                  Expanded(child: Text(rovers[position].name))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Launch Date")),
                  Expanded(child: Text(rovers[position].launchDate))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Landing Date")),
                  Expanded(child: Text(rovers[position].landingDate))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Status")),
                  Expanded(child: Text(rovers[position].currentStatus))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
