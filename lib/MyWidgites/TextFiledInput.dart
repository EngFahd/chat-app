import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/Constant.dart';
import 'package:flutter_application_10/cubit/chat_cubit/cubit/chat_p_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFeildInput extends StatelessWidget {
  TextFeildInput({
    super.key,
    required this.controller,
    required this.massages,
    this.email,
    required ScrollController controllerScrool,
  }) : _controllerScrool = controllerScrool;

  final TextEditingController controller;
  final CollectionReference<Object?> massages;
  String? email;

  final ScrollController _controllerScrool;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        // remmeber this line
        controller: controller,
        onSubmitted: (value) {
          BlocProvider.of<ChatPCubit>(context).sendMessage(value, email!);
          controller.clear();
          _controllerScrool.animateTo(
            0,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
        },
        decoration: InputDecoration(
          hintText: 'Hint',
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
