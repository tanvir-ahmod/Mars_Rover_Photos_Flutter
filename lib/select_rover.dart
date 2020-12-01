import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectRover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Rover"),
      ),
      body: Column(
        children: [
          Text(
            'Rover1',
          )
        ],
      ),
    );
  }
}
