import 'package:flutter/material.dart';

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.info, size: 64),
          const SizedBox(height: 16),
          Text("It's empty here", style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
