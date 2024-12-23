import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  String? error;

  ErrorDisplay({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    if (error == null) {
      return SizedBox.shrink();
    }

    return Text(
      error!,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 239, 73, 31),
      ),
    );
  }
}
