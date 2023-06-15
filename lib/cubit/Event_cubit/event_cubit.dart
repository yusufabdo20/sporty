import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/models/event_model.dart';
import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());
  String city = '';
  String date = '';
  CollectionReference events = FirebaseFirestore.instance.collection('events');
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
      print(eventDocRef);

      eventDocRef.then((docRef) {
        final usersCollection = docRef.collection('users');
        usersCollection.add({
          'userEmail': userEmail,
          'userAdmin': true,
        });
      });
      print(eventDocRef);
      eventDocRef.then((docRef) {
        final usersCollection = docRef.collection('messages');
        usersCollection.add({
          'message': 'Hi',
          'idMail': userEmail,
        });
      });
      print(eventDocRef);
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

  // Future<void> getAllEvents(CollectionReference events) async {
  //   emit(EventLoading());
  //   try {
  //     final eventsSnapshot = await events.get();
  //     final eventsList = eventsSnapshot.docs;

  //     final List<EventsModel> allEvents = [];
  //     for (var eventDoc in eventsList) {
  //       final eventId = eventDoc.id;
  //       final eventData = eventDoc.data();

  //       final usersSnapshot =
  //           await eventDoc.reference.collection('users').get();
  //       final usersList = usersSnapshot.docs;

  //       final List<UserModel> allUsers = UserModel.fromJsonList(
  //           usersList.map((userDoc) => userDoc.data()).toList());

  //       final messagesSnapshot =
  //           await eventDoc.reference.collection('messages').get();
  //       final messagesList = messagesSnapshot.docs;

  //       final List<MessageModel> allMessages = MessageModel.fromJsonList(
  //           messagesList.map((messageDoc) => messageDoc.data()).toList());

  //       final event = EventsModel.fromJson({
  //         'eventId': eventId,
  //         'eventData': eventData,
  //         'users': allUsers,
  //         'messages': allMessages,
  //       });

  //       allEvents.add(event);
  //     }

  //     emit(EventSuccessWithList(allEvents));
  //   } catch (e) {
  //     emit(EventFailure());
  //   }
  // }

  void getEvents() {
    emit(EventLoading());
    events.orderBy('createdAt', descending: true).snapshots().listen((event) {
      List<EventsModel> eventList = [];
      for (var doc in event.docs) {
        eventList.add(EventsModel.fromJson(doc.data() as Map<String, dynamic>));
        print(doc.data());
      }
      emit(EventSuccessGitEvent(allEvents: eventList));
      print("======================");
      print(event);
    });
  }

Future<List<DocumentSnapshot>> getDataFromSubcollection() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('events')
      .doc('eventId')
      .collection('users')
      .get();

  return querySnapshot.docs;
}

  // void getUsersEvent(String eventId) {


  //   final eventDocRef = events.doc(eventId);
  //   final usersCollectionRef = eventDocRef.collection('users');

  //   usersCollectionRef.get().then((snapshot) {
  //     List<UserModel> userList = [];
  //     for (var doc in snapshot.docs) {
  //       userList.add(UserModel.fromJson(doc.data() as Map<String, dynamic>));
  //       print(doc.data());
  //     }
  //     emit(EventSuccessGitEventUsers(allEventsUsers: userList));
  //     print("======================");
  //     print(userList);
  //   }).catchError((error) {
  //     emit(EventFailure());
  //     print('Error retrieving users: $error');
  //   });
  // }

  // void getMessagesEvent(String eventId) {
  //   final eventDocRef = events.doc(eventId);
  //   final messagesCollectionRef = eventDocRef.collection('messages');

  //   messagesCollectionRef.get().then((snapshot) {
  //     List<MessageModel> messageList = [];
  //     for (var doc in snapshot.docs) {
  //       messageList
  //           .add(MessageModel.fromJson(doc.data() as Map<String, dynamic>));
  //       print(doc.data());
  //     }
  //     emit(EventSuccessGitEventMessages(allEventsMessages: messageList));
  //     print("======================");
  //     print(messageList);
  //   }).catchError((error) {
  //     emit(EventFailure());
  //     print('Error retrieving messages: $error');
  //   });
  // }
}
