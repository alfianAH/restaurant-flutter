import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  static const routeName = 'settings_page';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Settings',
          style: textTheme.headline5,
        ),
      ),
    );
  }
}