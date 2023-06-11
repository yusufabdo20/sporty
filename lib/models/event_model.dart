import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';

class EventModel {
  final String eventName, sportType, city, date;
  UserModel? users;
  MessageModel? messages;

  EventModel(
      {required this.messages,
      required this.eventName,
      required this.sportType,
      required this.city,
      required this.date,
      required this.users});

  factory EventModel.fromJson(jsonDate) {
    return EventModel(
      eventName: jsonDate['eventName'],
      sportType: jsonDate['sportType'],
      date: jsonDate['date'],
      city: jsonDate['city'],
      messages: MessageModel.fromJson('message'),
      users: UserModel.fromJson('users'),
    );
  }
}
