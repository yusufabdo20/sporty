// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:meta/meta.dart';
// import 'package:sporty/models/event_model.dart';
// import 'package:sporty/models/massage_model.dart';
// import 'package:sporty/models/user_model.dart';

// part 'event_cubit_state.dart';

// class EventCubitCubit extends Cubit<EventCubitState> {
//   EventCubitCubit() : super(EventCubitInitial());

//   final CollectionReference events =
//       FirebaseFirestore.instance.collection('events');
//   String userImage = 'assets/images/sportsman.png';
//   String city = '';

//   void sendEvent({
//     required String eventName,
//     required String sportType,
//     String? city,
//     required String date,
//     required String userEmail,
//     required bool userAdmin,
//   }) {
//     try {
//       final eventDocRef = events.add({
//         'eventName': eventName,
//         'sportType': sportType,
//         'city': city,
//         'date': date,
//         'createdAt': DateTime.now(),
//       });

//       eventDocRef.then((docRef) {
//         final usersCollection = docRef.collection('users');
//         usersCollection.add({
//           'userEmail': userEmail,
//           'userAdmin': true,
//         });
//       });
//     } catch (e) {
//       print('Error sending event: $e');
//     }
//   }

//   void addMessageToEvent(
//     String eventId, {
//     required String message,
//     required String createdAt,
//     required String email,
//   }) {
//     try {
//       final eventRef = events.doc(eventId);
//       final messagesCollection = eventRef.collection('messages');

//       messagesCollection.add({
//         'message': message,
//         'createdAt': DateTime.now(),
//         'email': email,
//       });
//     } catch (e) {
//       print('Error adding message to event: $e');
//     }
//   }

//   void addUserToEvent(
//     String eventId, {
//     required String userEmail,
//     required bool userAdmin,
//   }) {
//     try {
//       final eventRef = events.doc(eventId);
//       final usersCollection = eventRef.collection('users');

//       usersCollection.add({
//         'userEmail': userEmail,
//         'userAdmin': userAdmin,
//       });
//     } catch (e) {
//       print('Error adding user to event: $e');
//     }
//   }

  
//   Future<List<Map<String, dynamic>>> getAllEvents(CollectionReference events) async {
//   try {
//     final eventsSnapshot = await events.get();
//     final eventsList = eventsSnapshot.docs;

//     final List<Map<String, dynamic>> allEvents = [];

//     for (var eventDoc in eventsList) {
//       final eventId = eventDoc.id;
//       final eventData = eventDoc.data();

//       final usersSnapshot =
//           await eventDoc.reference.collection('users').get();
//       final usersList = usersSnapshot.docs;

//       final List<Map<String, dynamic>> allUsers = [];
//       for (var userDoc in usersList) {
//         final userData = userDoc.data();
//         allUsers.add(userData);
//       }

//       final messagesSnapshot =
//           await eventDoc.reference.collection('messages').get();
//       final messagesList = messagesSnapshot.docs;

//       final List<Map<String, dynamic>> allMessages = [];
//       for (var messageDoc in messagesList) {
//         final messageData = messageDoc.data();
//         allMessages.add(messageData);
//       }

//       final event = {
//         'eventId': eventId,
//         'eventData': eventData,
//         'users': allUsers,
//         'messages': allMessages,
//       };

//       allEvents.add(event);
//     }

//     print(allEvents);
//     return allEvents;
//   } catch (e) {
//     print('Error getting all events: $e');
//     return [];
//   }
// }


//   // Future<List<Map<String, dynamic>>> getAllEvents() async {
//   //   try {
//   //     final eventsSnapshot = await events.get();
//   //     final eventsList = eventsSnapshot.docs;

//   //     final List<Map<String, dynamic>> allEvents = [];

//   //     for (var eventDoc in eventsList) {
//   //       final eventId = eventDoc.id;
//   //       final eventData = eventDoc.data();

//   //       final usersSnapshot =
//   //           await eventDoc.reference.collection('users').get();
//   //       final usersList = usersSnapshot.docs;

//   //       final List<Map<String, dynamic>> allUsers = [];
//   //       for (var userDoc in usersList) {
//   //         final userData = userDoc.data();
//   //         allUsers.add(userData);
//   //       }

//   //       final messagesSnapshot =
//   //           await eventDoc.reference.collection('messages').get();
//   //       final messagesList = messagesSnapshot.docs;

//   //       final List<Map<String, dynamic>> allMessages = [];
//   //       for (var messageDoc in messagesList) {
//   //         final messageData = messageDoc.data();
//   //         allMessages.add(messageData);
//   //       }

//   //       final event = {
//   //         'eventId': eventId,
//   //         'eventData': eventData,
//   //         'users': allUsers,
//   //         'messages': allMessages,
//   //       };

        

//   //       allEvents.add(event);
//   //     }
//   //     print(allEvents);

//   //     return allEvents;
//   //   } catch (e) {
//   //     print('Error getting all events: $e');
//   //     return [];
//   //   }
//   // }

//   void deleteEvent(String eventId) {
//     String collectionPath = 'events/$eventId';

//     FirebaseFirestore.instance
//         .doc(collectionPath)
//         .delete()
//         .then((_) => print('Event deleted successfully'))
//         .catchError((error) => print('Failed to delete event: $error'));
//   }
// }
