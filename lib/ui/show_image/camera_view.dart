import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  final String image;
  final String text;

  CameraView(this.image, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          child: Image.asset(
            image,
            height: 80,
            width: 80,
            fit: BoxFit.fill,
          ),
        ),
        Material(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
            ),
            child: Padding(
              padding:  EdgeInsets.only(bottom: 2.0),
              child: Container(width: 80, child: Center(child: Text(text))),
            ))
      ],
    );
  }
}
