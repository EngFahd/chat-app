import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.lableText,
    this.onChanged,
    this.suffixIcon,
    required this.obscureText,
  });
  final String lableText;
  Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // blind input
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
          if (lableText == 'Email') {
            // Regex for validating email address
            String pattern =
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
            RegExp regex = RegExp(pattern);
            if (!value.endsWith('@gmail.com')) {
              return "Email must be a @gmail.com address";
            }
            if (!regex.hasMatch(value)) {
              return "Please enter a valid email address";
            }

            return null;
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          // to max hight and width
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          labelText: lableText,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: "Enter Your Name",
          hintStyle: const TextStyle(color: Colors.white),
          suffixIconColor: Colors.blue,
          suffixIcon: suffixIcon,
          // default whit click click
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(16),
          ),
          // ======= > enabledBorder :  not click
        ),
      ),
    ));
  }
}
