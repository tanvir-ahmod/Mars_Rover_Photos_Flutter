import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_image_flutter/rover_selection/rover_view.dart';
import 'package:mars_rover_image_flutter/utills/app_router.dart';

class SelectRover extends StatefulWidget {
  @override
  _SelectRoverState createState() => _SelectRoverState();
}

class _SelectRoverState extends State<SelectRover> {
  final _controller = new PageController();
  double indicator = 0;

  final List<Widget> _pages = <Widget>[
    RoverView(0),
    RoverView(1),
    RoverView(2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select a Rover',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            DotsIndicator(
                dotsCount: _pages.length,
                position: indicator,
                decorator: DotsDecorator(activeColor: Colors.green)),
            Expanded(
              child: PageView(
                controller: _controller,
                children: _pages,
                onPageChanged: (int page) {
                  setState(() {
                    indicator = page.toDouble();
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushNamed(context, ShowImageRoute,
              arguments: RoverView.rovers[indicator.toInt()].name);
        },
      ),
    );
  }
}
