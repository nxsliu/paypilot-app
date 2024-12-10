import 'package:flutter/material.dart';

class PositionBottom extends StatelessWidget {
  final Widget child;

  const PositionBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32.0,
      left: 32.0,
      right: 32.0,
      child: child,
    );
  }
}
