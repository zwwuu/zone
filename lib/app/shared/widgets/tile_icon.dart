import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/item_type.dart';

class TileIcon extends StatelessWidget {
  final ItemType type;

  const TileIcon({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: double.infinity, child: _buildIcon());
  }

  Widget _buildIcon() {
    switch (type) {
      case ItemType.job:
        return Icon(
          MdiIcons.briefcase,
          color: Colors.orange,
        );
      case ItemType.ask:
        return Icon(
          MdiIcons.commentQuestion,
        );
      case ItemType.poll:
        return Icon(
          MdiIcons.pollBox,
        );
      case ItemType.story:
      default:
        return Icon(
          MdiIcons.newspaper,
        );
    }
  }
}
