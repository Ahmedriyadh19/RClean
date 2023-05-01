import 'package:flutter/material.dart';
import 'package:r_clean_admin/View/Components/admin_option.dart';
import 'package:r_clean_admin/View/Components/background.dart';
import 'package:r_clean_admin/View/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  final Function f1;
  final Function f2;
  final Function f3;
  const MyDrawer({super.key, required this.f1, required this.f2, required this.f3});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final List<MyAdminOption> options = [];

  @override
  void initState() {
    super.initState();
    options.add(MyAdminOption(
      title: 'Dashboard',
      description: 'View statical reports',
      myFunction: widget.f1,
      icon: Icons.dashboard,
    ));
    options.add(MyAdminOption(
      title: 'Requests',
      description: 'Manage cleaning requests',
      myFunction: widget.f2,
      icon: Icons.description,
    ));
    options.add(MyAdminOption(title: 'Users', description: "Manage system's users", myFunction: widget.f3, icon: Icons.people_alt_rounded));
  }

  void logoutAction() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('login', false);
  }

  Container logoutBtn({required BuildContext ctx}) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Logout'),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.logout_rounded,
            ),
          ],
        ),
        onPressed: () async {
          logoutAction();
          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => const LoginPage()));
        },
      ),
    );
  }

  Expanded space() {
    return const Expanded(child: SizedBox());
  }

  Divider div() {
    return Divider(color: Colors.amber[900], endIndent: 20, indent: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [const MyBackground(), options[0], options[1], options[2], space(), div(), logoutBtn(ctx: context)]),
    );
  }
}
