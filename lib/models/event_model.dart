import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';

class EventsModel {
  final String eventName, sportType, city, date;
  String eventId;
  List<UserModel>? users;
  List<MessageModel>? messages;

  EventsModel(
      {this.messages,
      required this.eventName,
      required this.eventId,
      required this.sportType,
      required this.city,
      required this.date,
       this.users});

  factory EventsModel.fromJson(Map<String, dynamic> jsonData) {
    print('moooooooooooo');
    return EventsModel(
      eventName: jsonData['eventName'],
      sportType: jsonData['sportType'],
      date: 'monday',
      city: jsonData['city'],
      // messages: jsonData['messages']!=null ? MessageModel.fromJsonList(jsonData['messages']) : [],
      // users: [UserModel.fromJsonList(jsonData['users'])],
      // users: [],
      // eventId: '23',
      eventId: jsonData['eventId'],
    );
  }
}
