import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ErrorConsumerState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  String? error = null;

  void clearError() {
    setState(() {
      error = null;
    });
  }

  void setError(String e) {
    setState(() {
      error = e;
    });
  }
}
