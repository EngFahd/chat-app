import 'package:flutter/material.dart';
import 'package:flutter_application_10/Constant.dart';
import 'package:flutter_application_10/Models/Massages.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.Massage,
  });
  final Massages Massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 15),
        // height: 65,
        // width: 200,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
              // bottomLeft: Radius.circular(10),
            )),
        child: Text(
          Massage.Message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class MessageContainerFrind extends StatelessWidget {
  MessageContainerFrind({
    super.key,
    required this.Massage,
  });
  Massages? Massage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 15),
        // height: 65,
        // width: 200,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
              // bottomLeft: Radius.circular(10),
            )),
        child: Text(
          Massage!.Message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class MassageForMe extends StatelessWidget {
  MassageForMe({
    super.key,
    required this.Massage,
  });
  Massages? Massage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 15),
        // height: 65,
        // width: 200,
        decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              // bottomRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            )),
        child: Text(
          Massage!.Message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
