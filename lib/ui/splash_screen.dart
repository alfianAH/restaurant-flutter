import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/main_scaffold.dart';

class SplashScreen extends StatefulWidget{
  final ValueNotifier<ThemeMode> notifier;
  final ThemeMode mode;

  const SplashScreen({
    required this.notifier,
    required this.mode,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      (){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context){
            return MainScaffold(
              notifier: widget.notifier,
              currentTheme: widget.mode,
            );
          }
        ));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: FlutterLogo(
          size: 150
        ),
      ),
    );
  }
}