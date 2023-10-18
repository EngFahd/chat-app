import 'package:flutter_application_10/Constant.dart';

class Massages {
  final String Message;
  final String id;
  Massages(
    this.Message,
    this.id
  );

  factory Massages.fromJson(JsonData) {
    return Massages(JsonData[kMassage]
    , JsonData['email']
    );
  }
}
