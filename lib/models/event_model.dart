import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';

class EventModel {
  final String eventName, sportType, city, date;
  final UserModel users;
  final MessageModel message;

  EventModel({
    required this.eventName,
    required this.sportType,
    required this.city,
    required this.date,
    required this.users,
    required this.message,
  });
}
