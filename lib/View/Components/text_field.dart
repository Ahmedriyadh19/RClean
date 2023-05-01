import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String name;
  final bool isPassword;
  final TextEditingController myController;
  

  const MyTextField({super.key, required this.name, required this.isPassword, required this.myController});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _showPassword = false;
  String? errors;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: widget.name,
          errorText: errors,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: _showPassword ? const Icon(Icons.visibility_off_rounded) : const Icon(Icons.visibility_rounded),
                )
              : null),
      onChanged: (value) {
        setState(() {
          if (value.isEmpty || value.trim().isEmpty) {
            errors = 'Invalid';
          } else {
            errors = null;
          }
        });
      },
      obscureText: !_showPassword && widget.isPassword,
      controller: widget.myController,
    );
  }
}
