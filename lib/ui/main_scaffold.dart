import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:restaurant_app/common/colors.dart';
import 'package:restaurant_app/ui/home/home_page.dart';
import 'package:restaurant_app/ui/settings/settings_page.dart';
import 'package:restaurant_app/ui/widgets/adaptive_icon.dart';
import 'package:restaurant_app/ui/widgets/platform_widget.dart';

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
        icon: AdaptiveIcon(
          iosIcon: CupertinoIcons.home, // iOS Icon
          androidIcon: Icons.home_rounded, // Other icon
        ),
        title: 'Home',
        activeColorPrimary: activeOtherColor,
        inactiveColorPrimary: inactiveOtherColor,
      ),

      // Settings
      PersistentBottomNavBarItem(
        icon: AdaptiveIcon(
          iosIcon: CupertinoIcons.settings, // iOS Icon
          androidIcon: Icons.settings_rounded, // Other icon
        ),
        title: 'Settings',
        activeColorPrimary: activeOtherColor,
        inactiveColorPrimary: inactiveOtherColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos
    );
  }

  @override
  void dispose() {
    _bottomNavController.dispose();
    super.dispose();
  }

  /// Scaffold for android
  Widget _buildAndroid(BuildContext context){
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: PersistentTabView(
          context,
          controller: _bottomNavController,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          screens: _screens(context),
          items: _navBarItems(),
          navBarStyle: NavBarStyle.style13,
        ),
      ),
    );
  }

  /// Scaffold for iOS
  Widget _buildIos(BuildContext context){
    return SafeArea(
      child: CupertinoPageScaffold(
        child: PersistentTabView(
          context,
          controller: _bottomNavController,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          screens: _screens(context),
          items: _navBarItems(),
          navBarStyle: NavBarStyle.style13,
        ),
      ),
    );
  }
}