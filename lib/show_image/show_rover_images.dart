import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_image_flutter/show_image/custom_app_bar.dart';

class ShowRoverImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
