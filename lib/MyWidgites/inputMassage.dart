import 'package:flutter/material.dart';
import 'package:flutter_application_10/Constant.dart';

class InputMassageChat extends StatelessWidget {
  const InputMassageChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Hint',
          suffix: const Icon(Icons.send),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
