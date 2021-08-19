import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  static const routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Restaurant',
          style: textTheme.headline5,
        ),
      ),
    );
  }
}