import 'package:flutter/material.dart';
import 'package:r_clean_admin/View/Components/user_box.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserBox> r = [];
  @override
  Widget build(BuildContext context) {
    return r.isNotEmpty
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 600,
                    color: Colors.greenAccent,
                  )
                ],
              ),
              Expanded(
                child: GridView(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 200, maxCrossAxisExtent: 600, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                  children: r,
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
