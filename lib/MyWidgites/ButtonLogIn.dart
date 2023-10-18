import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  ButtonLogin({required this.title, this.onTap});
  VoidCallback? onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        width: double.infinity,
        child: Center(
            child: Text(
          '$title',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        )),
      ),
    );
  }
}
