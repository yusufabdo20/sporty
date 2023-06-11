import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sporty/models/event_model.dart';
import 'package:sporty/models/massage_model.dart';

import '../../constanse.dart';

part 'event_state.dart';

class EventCubit extends Cubit<ChatState> {
  EventCubit() : super(EventInitial());
  CollectionReference events =
      FirebaseFirestore.instance.collection('Events');
  void sendMessage({required String message, required String email}) {
    try {
      events.add(
        {
          kMassage: message, //
          kCreatedAt: DateTime.now(), // 
          uniqId: email, // 
        },
      );
    } on Exception catch (e) {}
  }

  void getMessages() {
    events.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<EventModel> eventList = [];
      for (var doc in event.docs) {
        eventList.add(EventModel.fromJson(doc));
      }
      emit(EventSuccess(event: eventList));
    });
  }
}
