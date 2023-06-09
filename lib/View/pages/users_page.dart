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
  void initState() {
    super.initState();
  }

  fetchUsers() {
    for (int i = 0; i < 500; i++) {
     // r.add(const UserBox(u: MyUser(address: ''),));
    }
  }

  Center loading() {
    return const Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: CircularProgressIndicator(),
          ),
          Text('Loading ...')
        ],
      ),
    );
  }

  Expanded gotData() {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 200, maxCrossAxisExtent: 600, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        children: r,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  sorting(),
        r.isNotEmpty ? gotData() : loading()
      ],
    );
  }
}
