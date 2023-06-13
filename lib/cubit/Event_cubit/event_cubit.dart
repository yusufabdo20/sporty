import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sporty/models/event_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());
  String city = '';
  String date = '';
  final CollectionReference events =
      FirebaseFirestore.instance.collection('events');
  void createEvent({
    required String eventName,
    required String sportType,
    required String userEmail,
    required bool userAdmin,
  }) {
    emit(EventLoading());
    try {
      final eventDocRef = events.add({
        'eventName': eventName,
        'sportType': sportType,
        'city': city,
        'date': date,
        'createdAt': DateTime.now(),
      });

      eventDocRef.then((docRef) {
        final usersCollection = docRef.collection('users');
        usersCollection.add({
          'userEmail': userEmail,
          'userAdmin': true,
        });
      });
      emit(EventSuccess());
    } catch (e) {
      emit(EventFailure());
      print('Error sending event: $e');
    }
  }

  void deleteEvent(String eventId) {
    emit(EventLoading());
    String collectionPath = 'events/$eventId';

    FirebaseFirestore.instance
        .doc(collectionPath)
        .delete()
        .then((_) => emit(EventSuccess()))
        .catchError((error) => emit(EventFailure()));
  }

  Future<void> getAllEvents(CollectionReference events) async {
    emit(EventLoading());
    try {
      final eventsSnapshot = await events.get();
      final eventsList = eventsSnapshot.docs;

      final List<Map<String, dynamic>> allEvents = [];

      for (var eventDoc in eventsList) {
        final eventId = eventDoc.id;
        final eventData = eventDoc.data();

        final usersSnapshot =
            await eventDoc.reference.collection('users').get();
        final usersList = usersSnapshot.docs;

        final List<Map<String, dynamic>> allUsers = [];
        for (var userDoc in usersList) {
          final userData = userDoc.data();
          allUsers.add(userData);
        }

        final messagesSnapshot =
            await eventDoc.reference.collection('messages').get();
        final messagesList = messagesSnapshot.docs;

        final List<Map<String, dynamic>> allMessages = [];
        for (var messageDoc in messagesList) {
          final messageData = messageDoc.data();
          allMessages.add(messageData);
        }

        final event = {
          'eventId': eventId,
          'eventData': eventData,
          'users': allUsers,
          'messages': allMessages,
        };

        allEvents.add(event);
      }

      emit(EventSuccessWithList(allEvents));
    } catch (e) {
      emit(EventFailure());
    }
  }
}
