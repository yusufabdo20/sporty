class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);

  factory MessageModel.fromJson(Map<String, dynamic> jsonData) {
    return MessageModel(jsonData['message'], jsonData['idMail']);
  }

// In MessageModel class
  static List<MessageModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((jsonData) => MessageModel.fromJson(jsonData)).toList();
  }
}
