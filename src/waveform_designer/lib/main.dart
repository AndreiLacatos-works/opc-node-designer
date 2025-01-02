import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/screens/AppInitializer.dart';
import 'package:opc_node_designer/screens/WaveformDesigner.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/screens/WaveformLauncher.dart';
import 'package:window_manager/window_manager.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  await windowManager.setTitle('Waveform designer');

  runApp(
    ProviderScope(
      child: MyApp(
        starterFile: args.firstOrNull,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? starterFile;

  const MyApp({
    this.starterFile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Waveform designer',
      color: AppTheme.background,
      home: AppInitializer(starterFile: starterFile),
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return PageRouteBuilder<T>(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return builder(context);
          },
        );
      },
      routes: {
        '/designer': (_) => WaveformDesigner(),
        '/launcher': (_) => WaveformLauncher(),
      },
    );
  }
}
