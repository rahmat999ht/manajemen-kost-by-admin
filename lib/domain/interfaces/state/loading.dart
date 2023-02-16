import 'package:flutter/material.dart';

class LaodingState extends StatelessWidget {
  const LaodingState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
