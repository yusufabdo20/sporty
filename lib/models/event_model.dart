import 'package:sporty/models/massage_model.dart';

class EventModel {
  final dynamic id;
  final String title;
  final String city;
  final String date;
  final String image;
  final String category;
  final String user;
  final MassageModel massage;

  EventModel(
      {required this.id,
      required this.title,
      required this.city,
      required this.date,
      required this.category,
      required this.massage,
      required this.image,
      required this.user});

  

}
