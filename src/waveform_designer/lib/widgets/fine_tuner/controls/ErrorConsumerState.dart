import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ErrorHandler {
  String? get error;
  void clearError();
  void setError(String e);
}

mixin ErrorHandlerMixin on ConsumerStatefulWidget {
  void handleError(ErrorHandler handler, String e) {
    handler.setError(e);
  }

  void clearErrorState(ErrorHandler handler) {
    handler.clearError();
  }
}

abstract class ErrorConsumerState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> implements ErrorHandler {
  String? _error;

  @override
  String? get error => _error;

  @override
  void clearError() {
    setState(() {
      _error = null;
    });
  }

  @override
  void setError(String e) {
    setState(() {
      _error = e;
    });
  }
}
