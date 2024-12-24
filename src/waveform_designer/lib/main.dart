import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/screens/WaveformDesigner.dart';
import 'package:waveform_designer/widgets/home/WaveformLauncher.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  await windowManager.setTitle('Waveform designer');

  runApp(
    ProviderScope(
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 45, 45, 45)),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Waveform designer',
      color: Color.fromARGB(255, 45, 45, 45),
      home: WaveformLauncher(),
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
      },
    );
  }
}
