import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_10/Constant.dart';
import 'package:flutter_application_10/Models/Massages.dart';
import 'package:meta/meta.dart';

part 'chat_p_state.dart';

class ChatPCubit extends Cubit<ChatPState> {
  ChatPCubit() : super(ChatPInitial());
  // refrances to acess massages infire store
  CollectionReference massages =
      FirebaseFirestore.instance.collection('massages');
  List<Massages> massagesList = [];
  Future<void> showMassage() async {
    await massages
        .orderBy(kCreatedDate, descending: true) // descending revers (order by)
        .snapshots() // snapshots() => return stream
        .listen(
      (event) {
        massagesList.clear();
        for (var doc in event.docs) {
          massagesList.add(Massages.fromJson(doc));
        }

        emit(ChatSuccess(massagesList: massagesList));
      },
    );
  }

  void sendMessage(String message, String email) {
    massages.add({
      kMassage: message,
      'email': email,
      kCreatedDate: DateTime.now(),
      // "id": email,
    });
  }
}

