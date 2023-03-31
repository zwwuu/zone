import 'package:flutter/material.dart';

class FullErrorIndicator extends StatelessWidget {
  const FullErrorIndicator(
      {super.key, this.message = 'Oops something went wrong'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Icon(Icons.error, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Oops something went wrong'),
          ],
        ),
      ),
    );
  }
}
