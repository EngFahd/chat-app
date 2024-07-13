import 'package:flutter/material.dart';

class CustomButtonLogin extends StatelessWidget {
  const CustomButtonLogin({
    super.key,
    this.onTap,
    required this.content,
  });
  final String content;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              content,
              style: const TextStyle(color: Color(0xff2B475e), fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
