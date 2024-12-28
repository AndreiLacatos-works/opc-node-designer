import 'dart:ui';

import 'package:flutter/widgets.dart';

Future<T?> showOverlay<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  var dialogRoute = RawDialogRoute<T>(
    barrierDismissible: false,
    transitionDuration: Duration(milliseconds: 120),
    pageBuilder: (context, _, __) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: builder(context),
      );
    },
  );

  return Navigator.of(context, rootNavigator: true).push<T>(
    dialogRoute,
  );
}
