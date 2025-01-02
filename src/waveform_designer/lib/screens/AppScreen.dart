import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';

class AppScreen extends StatelessWidget {
  final Widget child;

  const AppScreen({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: child,
    );
  }
}
