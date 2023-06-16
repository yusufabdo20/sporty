import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sporty/models/event_model.dart';
// import 'package:sporty/constanse.dart';
// import 'package:sporty/models/event_model.dart';
// import 'package:sporty/models/massage_model.dart';
// import 'package:sporty/models/user_model.dart';

part 'event_state.dart';

// class EventCubit extends Cubit<EventState> {
//   EventCubit() : super(EventInitial());
//   String city = '';
//   String date = '';
//   CollectionReference events = FirebaseFirestore.instance.collection('events');
//   void createEvent({
//     required String eventName,
//     required String sportType,
//     required String userEmail,
//     required bool userAdmin,
//   }) {
//     emit(EventLoading());
//     try {
//       final eventDocRef = events.add({
//         'eventName': eventName,
//         'sportType': sportType,
//         'city': city,
//         'date': date,
//         'createdAt': DateTime.now(),
//       });
//       print(eventDocRef);

//       eventDocRef.then((docRef) {
//         final usersCollection = docRef.collection('users');
//         usersCollection.add({
//           'userEmail': userEmail,
//           'userAdmin': true,
//         });
//       });
//       print(eventDocRef);
//       eventDocRef.then((docRef) {
//         final usersCollection = docRef.collection('messages');
//         usersCollection.add({
//           'message': 'Hi',
//           'idMail': userEmail,
//         });
//       });
//       print(eventDocRef);
//       emit(EventSuccess());
//     } catch (e) {
//       emit(EventFailure());
//       print('Error sending event: $e');
//     }
//   }

//   void deleteEvent(String eventId) {
//     emit(EventLoading());
//     String collectionPath = 'events/$eventId';

//     FirebaseFirestore.instance
//         .doc(collectionPath)
//         .delete()
//         .then((_) => emit(EventSuccess()))
//         .catchError((error) => emit(EventFailure()));
//   }

//   // Future<void> getAllEvents(CollectionReference events) async {
//   //   emit(EventLoading());
//   //   try {
//   //     final eventsSnapshot = await events.get();
//   //     final eventsList = eventsSnapshot.docs;

//   //     final List<EventsModel> allEvents = [];
//   //     for (var eventDoc in eventsList) {
//   //       final eventId = eventDoc.id;
//   //       final eventData = eventDoc.data();

//   //       final usersSnapshot =
//   //           await eventDoc.reference.collection('users').get();
//   //       final usersList = usersSnapshot.docs;

//   //       final List<UserModel> allUsers = UserModel.fromJsonList(
//   //           usersList.map((userDoc) => userDoc.data()).toList());

//   //       final messagesSnapshot =
//   //           await eventDoc.reference.collection('messages').get();
//   //       final messagesList = messagesSnapshot.docs;

//   //       final List<MessageModel> allMessages = MessageModel.fromJsonList(
//   //           messagesList.map((messageDoc) => messageDoc.data()).toList());

//   //       final event = EventsModel.fromJson({
//   //         'eventId': eventId,
//   //         'eventData': eventData,
//   //         'users': allUsers,
//   //         'messages': allMessages,
//   //       });

//   //       allEvents.add(event);
//   //     }

//   //     emit(EventSuccessWithList(allEvents));
//   //   } catch (e) {
//   //     emit(EventFailure());
//   //   }
//   // }

//   void getEvents() {
//     emit(EventLoading());
//     events.orderBy('createdAt', descending: true).snapshots().listen((event) {
//       List<EventsModel> eventList = [];
//       for (var doc in event.docs) {
//         eventList.add(EventsModel.fromJson(doc.data() as Map<String, dynamic>));
//         print(doc.data());
//       }
//       emit(EventSuccessGitEvent(allEvents: eventList));
//       print("======================");
//       print(event);
//     });
//   }

//   Future<List<DocumentSnapshot>> getDataFromSubcollection() async {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('users').get();
//     print(querySnapshot);
//     return querySnapshot.docs;
//   }

//   // void getUsersEvent(String eventId) {

//   //   final eventDocRef = events.doc(eventId);
//   //   final usersCollectionRef = eventDocRef.collection('users');

//   //   usersCollectionRef.get().then((snapshot) {
//   //     List<UserModel> userList = [];
//   //     for (var doc in snapshot.docs) {
//   //       userList.add(UserModel.fromJson(doc.data() as Map<String, dynamic>));
//   //       print(doc.data());
//   //     }
//   //     emit(EventSuccessGitEventUsers(allEventsUsers: userList));
//   //     print("======================");
//   //     print(userList);
//   //   }).catchError((error) {
//   //     emit(EventFailure());
//   //     print('Error retrieving users: $error');
//   //   });
//   // }

//   // void getMessagesEvent(String eventId) {
//   //   final eventDocRef = events.doc(eventId);
//   //   final messagesCollectionRef = eventDocRef.collection('messages');

//   //   messagesCollectionRef.get().then((snapshot) {
//   //     List<MessageModel> messageList = [];
//   //     for (var doc in snapshot.docs) {
//   //       messageList
//   //           .add(MessageModel.fromJson(doc.data() as Map<String, dynamic>));
//   //       print(doc.data());
//   //     }
//   //     emit(EventSuccessGitEventMessages(allEventsMessages: messageList));
//   //     print("======================");
//   //     print(messageList);
//   //   }).catchError((error) {
//   //     emit(EventFailure());
//   //     print('Error retrieving messages: $error');
//   //   });
//   // }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';

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
      final eventDocRef =
          events.doc(); // Create a document reference without specifying an ID
      final eventId = eventDocRef.id; // Retrieve the auto-generated event ID

      eventDocRef.set({
        'id': eventId, // Include the event ID in the event data
        'eventName': eventName,
        'sportType': sportType,
        'city': city,
        'date': date,
        'createdAt': DateTime.now(),
      });

      final usersCollection = eventDocRef.collection('users');
      usersCollection.add({
        'userEmail': userEmail,
        'userAdmin': true,
      });

      final messagesCollection = eventDocRef.collection('messages');
      messagesCollection.add({
        'message': 'Hi',
        'idMail': userEmail,
      });

      emit(EventSuccess());
    } catch (e) {
      emit(EventFailure());
      print('Error sending event: $e');
    }
  }
  // void getEvent(String eventId) {
  //   emit(EventLoading());
  //   try {
  //     final eventDocRef = events.doc(eventId);

  //     eventDocRef.get().then((docSnapshot) {
  //       final eventModel = EventModel.fromMap(
  //           docSnapshot.data() as Map<String, dynamic>, docSnapshot.id);

  //       // Fetch users subcollection
  //       final usersCollection = eventDocRef.collection('users');
  //       usersCollection.get().then((usersSnapshot) {
  //         final List<Map<String, dynamic>> usersData = [];
  //         for (var userDoc in usersSnapshot.docs) {
  //           usersData.add(userDoc.data() as Map<String, dynamic>);
  //         }
  //         eventModel.users = usersData;
  //       });

  //       // Fetch messages subcollection
  //       final messagesCollection = eventDocRef.collection('messages');
  //       messagesCollection.get().then((messagesSnapshot) {
  //         final List<Map<String, dynamic>> messagesData = [];
  //         for (var messageDoc in messagesSnapshot.docs) {
  //           messagesData.add(messageDoc.data() as Map<String, dynamic>);
  //         }
  //         eventModel.messages = messagesData;
  //       });

  //       // Emit the EventSuccess state with the retrieved eventModel
  //       emit(EventSuccess(events: [eventModel]));
  //     });

  //     emit(EventSuccess());
  //   } catch (e) {
  //     emit(EventFailure());
  //     print('Error retrieving event: $e');
  //   }
  // }

  void joinEvent(String eventId, String userEmail) {
    emit(EventLoading());
    try {
      final eventDocRef = events.doc(eventId);

      // Add the user to the 'users' subcollection of the event
      final usersCollection = eventDocRef.collection('users');
      usersCollection.add({
        'userEmail': userEmail,
        'userAdmin': false,
      });

      emit(EventJoinSuccess()); // Emit the EventJoinSuccess state
    } catch (e) {
      emit(EventFailure());
      print('Error joining event: $e');
    }
  }

  void deleteEvent(String eventId, String userEmail) {
    emit(EventLoading());
    try {
      final eventDocRef = events.doc(eventId);

      // Retrieve the event document
      eventDocRef.get().then((docSnapshot) {
        final eventModel = EventModel.fromMap(
            docSnapshot.data() as Map<String, dynamic>, docSnapshot.id);

        // Check if the user is an admin
        final List<Map<String, dynamic>> users = eventModel.users;
        final isAdminUser = users.any((user) =>
            user['userEmail'] == userEmail && user['userAdmin'] == true);

        if (isAdminUser) {
          // Delete the event document
          eventDocRef.delete();

          emit(EventSuccess());
        } else {
          emit(EventFailure());
          print('User is not an admin and cannot delete the event.');
        }
      });
    } catch (e) {
      emit(EventFailure());
      print('Error deleting event: $e');
    }
  }

  void addMessageToEvent(String eventId, String message, String userEmail) {
    emit(EventLoading());
    try {
      final eventDocRef = events.doc(eventId);
      final messagesCollection = eventDocRef.collection('messages');
      messagesCollection.add({
        'message': message,
        'idMail': userEmail,
      });

      emit(EventSuccess());
    } catch (e) {
      emit(EventFailure());
      print('Error adding message to event: $e');
    }
  }

  void getEventsJoinedByUser(String userEmail) {
    emit(EventLoading());
    try {
      final filteredEvents = <EventModel>[];

      events.get().then((querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          final eventModel = EventModel.fromMap(
              docSnapshot.data() as Map<String, dynamic>, docSnapshot.id);

          // Check if the user is joined in the event
          final List<Map<String, dynamic>> users = eventModel.users;
          final isUserJoined =
              users.any((user) => user['userEmail'] == userEmail);

          // Add the event to the filteredEvents list if the user has joined
          if (isUserJoined) {
            filteredEvents.add(eventModel);
          }
        }

        emit(EventSuccessJoined(
          joinevents: filteredEvents,
        ));
      });
    } catch (e) {
      emit(EventFailure());
      print('Error retrieving events joined by user: $e');
    }
  }

  void getEventsNotJoinedByUser(String userEmail) {
    emit(EventLoading());
    try {
      final filteredEvents = <EventModel>[];

      events.get().then((querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          final eventMap = docSnapshot.data() as Map<String, dynamic>?;
          if (eventMap != null) {
            final eventModel = EventModel.fromMap(eventMap, docSnapshot.id);

            // Check if the 'users' and 'messages' properties are present and not null
            final List<Map<String, dynamic>>? users =
                eventMap['users'] as List<Map<String, dynamic>>?;
            final List<Map<String, dynamic>>? messages =
                eventMap['messages'] as List<Map<String, dynamic>>?;

            if (users != null && messages != null) {
              // Check if the user is already joined in the event
              final isUserJoined =
                  users.any((user) => user['userEmail'] == userEmail);

              // Add the event to the filteredEvents list if the user has not joined
              if (!isUserJoined) {
                filteredEvents.add(eventModel);
              }
            }
          }
        }

        emit(EventSuccessNotJoined(events: filteredEvents));
      });
    } catch (e) {
      emit(EventFailure());
      print('Error retrieving events not joined by user: $e');
    }
  }
}
