import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:restaurant_app/common/theme.dart';
import 'package:restaurant_app/ui/main_scaffold.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}: ${event.time}: ${event.message}');
  });
}

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (context, mode, child) {
        return MaterialApp(
          title: 'Restaurant',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode,
          home: MainScaffold(
            notifier: _notifier,
            currentTheme: mode,
          ),
        );
      },
    );
  }
}
