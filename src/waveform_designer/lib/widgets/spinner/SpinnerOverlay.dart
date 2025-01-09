import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opc_node_designer/state/spinner/spinner.state.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';

class SpinnerOverlay extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpinnerOverlayState();
}

class _SpinnerOverlayState extends ConsumerState<SpinnerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = ref.watch(spinnerStateProvider).active;
    if (!active) {
      return SizedBox.shrink();
    }
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppTheme.transparent,
          ),
          SizedBox.expand(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotationTransition(
                    turns: _controller,
                    child: FaIcon(
                      FontAwesomeIcons.rotate,
                      color: AppTheme.accentColor,
                      size: 64,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
