import 'package:flutter/material.dart';
import 'package:r_clean_admin/Controller/my_custom_scroll_behavior.dart';
import 'package:r_clean_admin/View/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_manager/theme_manager.dart';
import 'View/pages/main_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isLoggedIn = preferences.getBool('login') ?? false;

  runApp(MyApp(
    isLogged: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({super.key, required this.isLogged});

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(primarySwatch: Colors.blue, brightness: brightness, useMaterial3: true),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'RClean - Admin',
          theme: theme,
          home: isLogged ? const MainNavigator() : const LoginPage(),
        );
      },
    );
  }
}
