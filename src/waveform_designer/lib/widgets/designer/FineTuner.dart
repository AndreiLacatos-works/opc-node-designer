import 'package:flutter/widgets.dart';

class FineTuner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 74, 144, 226)),
      width: 320,
      height: double.infinity,
      child: Text("Fine tuner"),
    );
  }
}
