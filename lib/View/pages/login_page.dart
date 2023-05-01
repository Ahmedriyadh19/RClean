import 'package:flutter/material.dart';
import 'package:r_clean_admin/View/Components/text_field.dart';
import 'package:r_clean_admin/View/pages/main_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextEditingController> mted = [TextEditingController(), TextEditingController()];
  final List<MyTextField> mtf = [];
  String? errorText;
  bool loginError = false;

  @override
  void initState() {
    super.initState();

    mtf.add(MyTextField(
      isPassword: false,
      name: 'Email',
      myController: mted[0],
    ));

    mtf.add(MyTextField(
      isPassword: true,
      name: 'Password',
      myController: mted[1],
    ));
  }

  validation() async {
    if (mted[0].text.isNotEmpty && mted[1].text.isNotEmpty) {
      saveSeason();
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MainNavigator()));
    } else {
      setState(() {
        loginError = true;
        errorText = 'Invalid';
      });
    }
  }

  void saveSeason() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('login', true);
  }

  ElevatedButton submitBtn() {
    return ElevatedButton(
      child: SizedBox(
          width: 100,
          child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Text('Login'), SizedBox(width: 20), Icon(Icons.login_rounded)]))),
      onPressed: () async {
        validation();
      },
    );
  }

  error() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        errorText!.toUpperCase(),
        style: const TextStyle(color: Colors.red, fontSize: 17),
      ),
    );
  }

  Container input({required double w, required double h}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
            Colors.blue.withOpacity(0),
            Colors.blue.withOpacity(0.2),
            Colors.blue.withOpacity(0.4),
            Colors.blue.withOpacity(0.6),
            Colors.blue.withOpacity(0.8),
            Colors.blue.withOpacity(1),
          ])),
      width: 550,
      height: 300,
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [mtf[0], mtf[1], if (loginError) error(), submitBtn()]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: input(h: h, w: w),
      ),
    );
  }
}
