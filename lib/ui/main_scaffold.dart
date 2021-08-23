import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:restaurant_app/common/colors.dart';
import 'package:restaurant_app/ui/home/home_page.dart';
import 'package:restaurant_app/ui/settings/settings_page.dart';

class MainScaffold extends StatefulWidget{
  final ValueNotifier<ThemeMode> notifier;
  final ThemeMode currentTheme;

  const MainScaffold({
    required this.notifier,
    required this.currentTheme,
  });

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  PersistentTabController _bottomNavController = PersistentTabController(
    initialIndex: 0
  );

  /// List of screens for bottom navigation bar
  List<Widget> _screens(BuildContext context) => [
    HomePage(),
    SettingsPage(
      notifier: widget.notifier,
      currentTheme: widget.currentTheme,
    ),
  ];

  /// List of navigation bar items
  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      // Home
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_rounded),
        title: 'Home',
        activeColorPrimary: activeOtherColor,
        inactiveColorPrimary: inactiveOtherColor,
      ),

      // Settings
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_rounded),
        title: 'Settings',
        activeColorPrimary: activeOtherColor,
        inactiveColorPrimary: inactiveOtherColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _bottomNavController,
        backgroundColor: themeData.scaffoldBackgroundColor,
        screens: _screens(context),
        items: _navBarItems(),
        navBarStyle: NavBarStyle.style13,
      ),
    );
  }

  @override
  void dispose() {
    _bottomNavController.dispose();
    super.dispose();
  }
}