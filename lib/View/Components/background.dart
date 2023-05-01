import 'package:flutter/material.dart';

class MyBackground extends StatelessWidget {
  const MyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Image.asset('lib/assets/back.jpg'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text('Hello Admin'.toUpperCase(),
              style: const TextStyle(color: Colors.black, backgroundColor: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25)),
        ),
      ],
    );
  }
}
