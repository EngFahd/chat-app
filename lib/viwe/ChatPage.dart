import 'package:flutter/material.dart';
import 'package:flutter_application_10/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_10/Models/Massages.dart';
import 'package:flutter_application_10/MyWidgites/MassageCont.dart';
import 'package:flutter_application_10/MyWidgites/TextFiledInput.dart';
import 'package:flutter_application_10/MyWidgites/TextFiledWidgit.dart';
import 'package:flutter_application_10/MyWidgites/inputMassage.dart';
import 'package:flutter_application_10/cubit/chat_cubit/cubit/chat_p_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //  create instance of firebase firestore
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // to control text field and clear massage after submit
  TextEditingController controller = TextEditingController();
// refrances to acess massages infire store
  CollectionReference massages =
      FirebaseFirestore.instance.collection('massages');
  // to clear texet filed after send
  final controllerS = ScrollController();
//   to scrool to  end
  final ScrollController _controllerScrool = ScrollController();

  List<Massages> massagesList = [];

  @override
  Widget build(BuildContext context) {
    String emailMassage = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          _controllerScrool.animateTo(
            _controllerScrool.position.maxScrollExtent,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
        },
        child:const Icon(Icons.arrow_upward),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Logo,
              height: 65,
            ),
            const Text('Chat')
          ],
        ),
      ),
      body: Column(
        children: [
          // Stack(
          //   children: [
          //     Image.asset(
          //       "assets/images/f1dbafa6ecef6fd4230de73f344e04e2.jpg",
          //       height: MediaQuery.of(context).size.height,
          //       width: MediaQuery.of(context).size.width,
          //       fit: BoxFit.cover,
          //     ),
          //   ],
          // ),
          Expanded(
            child: BlocBuilder<ChatPCubit, ChatPState>(
              builder: (context, state) {
                massagesList =
                    BlocProvider.of<ChatPCubit>(context).massagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controllerScrool,
                  itemCount: massagesList.length,
                  itemBuilder: (context, index) {
                    return massagesList[index].id == emailMassage
                        ? MessageContainerFrind(Massage: massagesList[index])
                        : MassageForMe(Massage: massagesList[index]);
                    ;
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: TextFeildInput(
              email: emailMassage,
              controller: controller,
              massages: massages,
              // email: email,
              controllerScrool: _controllerScrool,
            ),
          ),
        ],
      ),
    );
  }
}
