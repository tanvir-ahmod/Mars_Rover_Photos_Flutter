import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
                color: Colors.black,
              ),
              Chip(
                onDeleted: () {},
                label: Text('No Filter'),
              ),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  IconButton(
                    icon: Icon(Icons.tune),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.black,
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
