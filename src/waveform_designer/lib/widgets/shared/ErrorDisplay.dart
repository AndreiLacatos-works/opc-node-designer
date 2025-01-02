import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';

class ErrorDisplay extends StatelessWidget {
  final String? error;

  const ErrorDisplay({
    required this.error,
    super.key,
  });

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
        color: AppTheme.danger,
      ),
    );
  }
}
