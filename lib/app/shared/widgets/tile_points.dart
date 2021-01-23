import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TilePoints extends StatelessWidget {
  final int points;

  const TilePoints({Key key, this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$points',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          MdiIcons.fire,
          color: Colors.red,
        ),
      ],
    );
  }
}
