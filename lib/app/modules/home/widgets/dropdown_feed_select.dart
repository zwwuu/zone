import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../shared/models/feed_type.dart';
import '../../../shared/util/extensions.dart';
import '../home_controller.dart';

class DropdownFeedSelect extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: controller.feedType.name,
          icon: Icon(
            MdiIcons.chevronDown,
          ),
          onChanged: (newValue) {
            controller.feedType = newValue.parseFeedType();
          },
          items: FeedType.values.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value.name,
              child: Text(
                value.name.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
