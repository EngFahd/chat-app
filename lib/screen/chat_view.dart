
import 'package:chat_app/models/massages_model.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:chat_app/widgets/custom_text_field_input_massage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = '/chatView';
  final scroolControlar = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    CollectionReference massages =
        FirebaseFirestore.instance.collection('massages');
    // to remove content after submit
    TextEditingController controller = TextEditingController();
    return StreamBuilder<QuerySnapshot>(
        stream: massages
            .orderBy('time', descending: true)
            .snapshots(), // => snapshot(container of data)
        builder: (context, snapshot) {
          List<MassagesModel> massagesList = [];
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              massagesList.add(
                MassagesModel.fromJson(
                  snapshot.data!.docs[i],
                ),
              );
            }
            return Scaffold(
                appBar: AppBar(
                  // arow icon
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xff2B475e),
                  centerTitle: true,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/scholar.png",
                        scale: 2,
                      ),
                      const Text(
                        ' Chat',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    // excption
                    Expanded(
                      child: ListView.builder(
                        controller: scroolControlar,
                        reverse: true,
                        itemCount: massagesList.length,
                        itemBuilder: (context, index) {
                          return massagesList[index].id == email
                              ? ChatBuble(
                                  massage: massagesList[index],
                                )
                              : ChatBubleForFrind(massage: massagesList[index]);
                        },
                      ),
                    ),
                    CustomTextFieldInputMassage(
                        controller: controller,
                        massages: massages,
                        email: email,
                        scroolControlar: scroolControlar)
                  ],
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
