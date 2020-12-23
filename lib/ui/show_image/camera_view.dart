import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  final String image;
  final String text;

  CameraView(this.image, this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(image, height: 100),
          ),
          Text(text)
        ],
      ),
    );
  }
}
