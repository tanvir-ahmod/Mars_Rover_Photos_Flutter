import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_event.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_state.dart';
import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/show_image/custom_app_bar.dart';

class ShowRoverImages extends StatelessWidget {
  final _roverName;

  ShowRoverImages(this._roverName);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowImageBloc>(context).add(LoadingEvent());
    BlocProvider.of<ShowImageBloc>(context)
        .add(FetchImageEvent(QueryModel(roverName: _roverName)));
    return BlocBuilder<ShowImageBloc, ShowImageState>(
        builder: (context, state) {
      if (state is LoadingState) {
        return _onLoading();
      } else
        return _showDummyImages();
    });
  }

  Widget _showDummyImages() {
    return Scaffold(
      appBar: CustomAppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/opportunity.webp",
                  height: 300, fit: BoxFit.fill),
            ),
          );
        }),
      ),
    );
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
}
