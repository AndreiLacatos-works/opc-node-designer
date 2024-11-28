import 'package:flutter/widgets.dart';
import 'package:waveform_designer/widgets/designer/TransitionPointControl.dart';
import 'package:waveform_designer/widgets/input/MultiLabeledInput.dart';

class FineTuner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stuff = List.generate(20, (i) => i).toList();
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 74, 144, 226)),
      padding: const EdgeInsets.all(40),
      width: 320,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          MultiLabeledInput(
            onChanged: (value) {},
            mainLabel: "Duration",
            secondaryLabel: "ms",
          ),
          SizedBox(
            height: 80,
          ),
          MultiLabeledInput(
            onChanged: (value) {},
            mainLabel: "Tick frequency",
            secondaryLabel: "ms",
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "Transition points",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stuff.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: TransitionPointControl(
                  key: Key(
                    index.toString(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
