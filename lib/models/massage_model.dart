import 'package:sporty/constanse.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);
  
  factory MessageModel.fromJson(jsonDate) {
    return MessageModel(jsonDate[kMassage], jsonDate[uniqId]);
  }
}
