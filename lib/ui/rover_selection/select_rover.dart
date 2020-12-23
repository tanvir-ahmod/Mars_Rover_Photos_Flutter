import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/rover_selection/rover_selection_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/rover_selection/rover_selection_event.dart';
import 'package:mars_rover_image_flutter/bloc/rover_selection/rover_selection_state.dart';
import 'package:mars_rover_image_flutter/models/rover.dart';
import 'package:mars_rover_image_flutter/ui/rover_selection/rover_view.dart';
import 'package:mars_rover_image_flutter/utills/app_router.dart';

class SelectRover extends StatefulWidget {
  @override
  _SelectRoverState createState() => _SelectRoverState();
}

class _SelectRoverState extends State<SelectRover> {
  final _controller = new PageController();
  double indicator = 0;

  List<Widget> _pages = [];
  List<Rover> _rovers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RoverSelectionBloc>(context).add(FetchRoverEvent());
    return BlocBuilder<RoverSelectionBloc, RoverSelectionState>(
        builder: (context, state) {
      if (state is FetchRoverState) {
        _rovers = state.rovers;
        _pages.clear();
        for (var rover in _rovers) {
          _pages.add(RoverView(rover));
        }
        return _roverSelectionUI();
      }

      return Container();
    });
  }

  Widget _roverSelectionUI() {
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
                dotsCount: _rovers.length,
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
              arguments: _rovers[indicator.toInt()]);
        },
      ),
    );
  }
}
