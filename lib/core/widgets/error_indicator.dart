import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
      leading: const Icon(Icons.error),
    );
  }
}
