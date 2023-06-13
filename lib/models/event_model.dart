import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';

class EventsModel {
  final String eventName, sportType, city, date;
  String eventId;
  List<UserModel> users;
  List<MessageModel>? messages = [];

  EventsModel(
      {this.messages,
      required this.eventName,
      required this.eventId,
      required this.sportType,
      required this.city,
      required this.date,
      required this.users});

  factory EventsModel.fromJson(Map<String, dynamic> jsonData) {
    return EventsModel(
      eventName: jsonData['eventName'],
      sportType: jsonData['sportType'],
      date: jsonData['date'],
      city: jsonData['city'],
      messages: MessageModel.fromJsonList(jsonData['messages']),
      users: UserModel.fromJsonList(jsonData['users']),
      eventId: jsonData['eventId'],
    );
  }
}
