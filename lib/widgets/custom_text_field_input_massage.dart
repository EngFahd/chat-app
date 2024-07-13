
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomTextFieldInputMassage extends StatelessWidget {
  const CustomTextFieldInputMassage({
    super.key,
    required this.controller,
    required this.massages,
    required this.email,
    required this.scroolControlar,
  });

  final TextEditingController controller;
  final CollectionReference<Object?> massages;
  final Object? email;
  final ScrollController scroolControlar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
          massages.add({
            'content': value,
            'time': Timestamp.now(),
            'id': email
          });
          controller.clear();
          scroolControlar.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        },
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.send),
          suffixIconColor: Color(0xff2B475e),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Color(0xff2B475e),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Color(0xff2B475e),
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          hintText: 'Enter your message',
        ),
      ),
    );
  }
}
