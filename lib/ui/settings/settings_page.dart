import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  final ValueNotifier<ThemeMode> notifier;
  final ThemeMode currentTheme;

  const SettingsPage({
    required this.notifier,
    required this.currentTheme,
  });

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isLightMode = widget.currentTheme == ThemeMode.light ? true : false;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: textTheme.headline5,
            ),

            Divider(
              color: textTheme.headline6!.color,
              thickness: 2,
            ),

            Container(
              width: 500,
              child: ListTile(
                title: Text('Light Theme'),
                trailing: Switch.adaptive(
                  value: isLightMode,
                  inactiveTrackColor: Colors.white,
                  activeColor: Colors.black,

                  onChanged: (value){
                    setState(() {
                      isLightMode = value;
                    });

                    widget.notifier.value = widget.currentTheme == ThemeMode.dark
                        ? ThemeMode.light : ThemeMode.dark;
                  },
                )
              ),
            )
          ]
        ),
      ),
    );
  }
}