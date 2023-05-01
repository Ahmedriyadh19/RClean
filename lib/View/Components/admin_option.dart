import 'package:flutter/material.dart';

class MyAdminOption extends StatelessWidget {
  final String title;
  final String description;
  final Function myFunction;
  final IconData icon;
  const MyAdminOption({super.key, required this.title, required this.description, required this.myFunction, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(description),
      leading: Icon(icon),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      hoverColor: Colors.blue.withOpacity(0.5),
      onTap: () {
        myFunction();
      },
    );
  }
}
