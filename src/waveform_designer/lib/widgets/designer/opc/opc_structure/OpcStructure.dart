import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';

class OpcStructure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (i) => "Item ${i}");
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              items[index],
              style: TextStyle(
                color: AppTheme.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
