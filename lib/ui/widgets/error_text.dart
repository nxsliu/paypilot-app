import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String errorText;

  const ErrorText({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(errorText, style: const TextStyle(color: Colors.red))]);
  }
}
