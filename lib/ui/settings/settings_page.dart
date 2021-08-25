import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/widgets/platform_widget.dart';

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
  TextTheme _textTheme(BuildContext context){
    return Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos
    );
  }

  Widget _buildSettingList(BuildContext context){
    bool isLightMode = widget.currentTheme == ThemeMode.light ? true : false;

    return Container(
      width: 500,
      child: ListView(
        children: [
          ListTile(
            title: Text(
              'Light Theme',
              style: _textTheme(context).headline6,
            ),
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
        ],
      )
    );
  }

  /// Scaffold for android
  Widget _buildAndroid(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: _textTheme(context).headline5,
              ),

              Divider(
                color: _textTheme(context).headline6!.color,
                thickness: 2,
              ),

              _buildSettingList(context),
            ]
          ),
        )
      ),
    );
  }

  /// Scaffold for iOS
  Widget _buildIos(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        middle: Text(
          'Settings',
          style: _textTheme(context).headline5,
        ),
      ),
      child: SafeArea(
        child: _buildSettingList(context),
      ),
    );
  }
}