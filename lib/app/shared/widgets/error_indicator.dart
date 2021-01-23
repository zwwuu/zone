import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ErrorIndicator extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorIndicator({
    Key key,
    @required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 15,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text('Oops something went wrong'),
          RaisedButton.icon(
            icon: Icon(MdiIcons.refresh),
            label: Text('Retry'),
            onPressed: onRetry,
          )
        ],
      ),
    );
  }
}
