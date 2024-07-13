class MassagesModel {
  final String massage;
  final String id;

  MassagesModel(this.massage, this.id);
  factory MassagesModel.fromJson(jsonData) {
    return MassagesModel(
      jsonData['content'],
      jsonData['id'],
    );
  }
}
