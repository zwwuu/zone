import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OptionMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text('About'),
        ),
      ],
      icon: Icon(MdiIcons.dotsVertical),
      tooltip: 'More',
      offset: Offset(0, 50),
      onSelected: (value) {
        showAboutDialog(
          context: context,
          applicationLegalese: '©2020 wuuzw',
        );
      },
    );
  }
}
