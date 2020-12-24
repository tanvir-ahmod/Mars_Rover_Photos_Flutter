import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_event.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_state.dart';
import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/models/rover.dart';
import 'package:mars_rover_image_flutter/models/rover_data.dart';
import 'package:mars_rover_image_flutter/ui/show_image/custom_app_bar.dart';

class ShowRoverImages extends StatelessWidget {
  final Rover _rover;
  RoverData _roverData;

  ShowRoverImages(this._rover);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowImageBloc>(context)
        .add(FetchImageEvent(QueryModel(roverName: _rover.name)));
    return BlocBuilder<ShowImageBloc, ShowImageState>(
        builder: (context, state) {
      if (state is LoadingState) {
        return _onLoading();
      } else if (state is FetchImageState) {
        _roverData = state.roverData;
        return _showImages(state.roverData);
      } else {
        return _roverData == null ? Container() : _showImages(_roverData);
      }
      return Container();
    });
  }

  Widget _showImages(RoverData roverData) {
    return Scaffold(
        appBar: CustomAppBar(_rover),
        body: GridView.builder(
          itemCount: roverData.photos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => _showDialog(
                  context,
                  _rover.name,
                  roverData.photos[index].img_src,
                  roverData.photos[index].earth_date),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    roverData.photos[index].img_src,
                    fit: BoxFit.fill,
                  )),
            );
          },
        ));
  }

  Widget _onLoading() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showDialog(
      BuildContext context, String name, String image, String earthDate) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(image, fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text("Name")),
                      Expanded(child: Text(name))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text("Earth Date")),
                      Expanded(child: Text(earthDate))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 4.0,
            top: 4.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => errorDialog);
  }
}
