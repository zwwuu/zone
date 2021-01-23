import 'package:flutter/material.dart';

class EmptyIndicator extends StatelessWidget {
  final IconData icon;
  final String message;

  const EmptyIndicator({Key key, this.icon, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.orange,
            ),
          ),
        ),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 15,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(icon),
            Text(message),
          ],
        ),
      ),
    );
  }
}
