import 'package:flutter/material.dart';
import 'package:r_clean_admin/View/Components/my_drawer.dart';
import 'package:r_clean_admin/View/pages/dashboard_page.dart';
import 'package:r_clean_admin/View/pages/requests_page.dart';
import 'package:r_clean_admin/View/pages/users_page.dart';
import 'package:theme_manager/theme_manager.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final Map<String, Widget> navigation = {'Dashboard': const DashboardPage(), 'Requests Clean': const RequestsPage(), 'Users': const UsersPage()};
  late bool _isDark;
  int index = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    setState(() {
      String currentMode = ThemeManager.of(context).brightness.toString().split('.')[1];
      if (currentMode == 'dark') {
        _isDark = true;
      } else {
        _isDark = false;
      }
    });
  }

  void action1() {
    setState(() {
      index = 0;
    });
  }

  void action2() {
    setState(() {
      index = 1;
    });
  }

  void action3() {
    setState(() {
      index = 2;
    });
  }

  Padding controlBright() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Tooltip(
        message: _isDark ? 'Light Mode' : 'Dark Mode',
        child: IconButton(
          icon: _isDark ? const Icon(Icons.light_mode_rounded) : const Icon(Icons.dark_mode_rounded),
          onPressed: () {
            setState(() {
              _isDark = !_isDark;
              _isDark
                  ? ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.dark)
                  : ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.light);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(navigation.keys.elementAt(index)),
        actions: [controlBright()],
      ),
      drawer: MyDrawer(f1: action1, f2: action2, f3: action3),
      body: navigation.values.elementAt(index),
    );
  }
}
