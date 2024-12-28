import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';
import 'package:waveform_designer/widgets/shared/SimpleButton.dart';

class IconButton extends StatelessWidget {
  final void Function() onClick;
  final Widget icon;
  final bool disabled;

  IconButton({
    required this.onClick,
    required this.icon,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      onClick: onClick,
      content: icon,
      disabled: disabled,
      color: AppTheme.transparent,
    );
  }
}
