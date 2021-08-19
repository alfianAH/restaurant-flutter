import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/theme.dart';
import 'package:restaurant_app/service/restaurant_provider_service.dart';
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
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RestaurantProviderService.create(),
      dispose: (_, RestaurantProviderService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Restaurant',
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: MainScaffold.routeName,
        routes: {
          MainScaffold.routeName: (context) => MainScaffold(),
        },
      ),
    );
  }
}
