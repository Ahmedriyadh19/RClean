import 'package:flutter/material.dart';
import 'package:r_clean_admin/View/Components/text_field.dart';
import 'package:r_clean_admin/View/Pages/main_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_manager/theme_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextEditingController> inputText = [TextEditingController(), TextEditingController()];
  final List<MyTextField> myTextField = [];
  String? errorText;
  bool loginError = false;

  @override
  void initState() {
    super.initState();

    myTextField.add(MyTextField(
      isPassword: false,
      name: 'Email',
      myController: inputText[0],
    ));

    myTextField.add(MyTextField(
      isPassword: true,
      name: 'Password',
      myController: inputText[1],
    ));
  }

  bool getMode() {
    String currentMode = ThemeManager.of(context).brightness.toString().split('.')[1];
    if (currentMode == 'dark') {
      return true;
    } else {
      return false;
    }
  }

  void validation() async {
    if (inputText[0].text.isNotEmpty && inputText[1].text.isNotEmpty) {
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

  Container error() {
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
          gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
            Colors.blue.withOpacity(0.8),
            Colors.blue.withOpacity(0.6),
            Colors.blue.withOpacity(0.4),
            Colors.blue.withOpacity(0.2),
          ])),
      width: 550,
      height: 300,
      padding: const EdgeInsets.all(20),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [myTextField[0], myTextField[1], if (loginError) error(), submitBtn()]),
    );
  }

  Container logo() {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(250), border: Border.all(width: 5, color: getMode() ? Colors.white : Colors.black)),
        height: 300,
        width: 300,
        child: Padding(padding: const EdgeInsets.all(25), child: getMode() ? Image.asset('lib/assets/1.png') : Image.asset('lib/assets/0.png')));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [logo(), const SizedBox(height: 50), input(h: h, w: w)]),
      ),
    );
  }
}
