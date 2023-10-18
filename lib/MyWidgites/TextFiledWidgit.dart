import 'package:flutter/material.dart';

class TextFiledWidgit extends StatelessWidget {
  TextFiledWidgit(
      {super.key, this.hint, this.OnChange, this.ObscureText = false});
  String? hint;
  Function(String)? OnChange;
  final bool? ObscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // to hide content text field
      obscureText: ObscureText!,
      // because Form widgit in reigister page
      validator: (data) {
        if (data!.isEmpty) {
          return 'worng';
        }
      },
      onChanged: OnChange,
      style: const TextStyle(color: Colors.white, fontSize: 24),
      decoration: InputDecoration(
        counterStyle: const TextStyle(color: Colors.blue),
        hintText: '$hint',
        hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
