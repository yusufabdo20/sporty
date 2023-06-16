part of 'event_cubit.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventFailure extends EventState {}

class EventSuccess extends EventState {}

class EventSuccessNotJoined extends EventState {
  List<EventModel>? events;
  EventSuccessNotJoined({this.events});
}

class EventSuccessJoined extends EventState {
  List<EventModel>? joinevents;
  EventSuccessJoined({this.joinevents});
}

class EventJoinSuccess extends EventState {}

// class EventSuccessGitEvent extends EventState {
//   List<EventsModel> allEvents;

//   EventSuccessGitEvent({required this.allEvents});
// }

// // class EventSuccessGitEventUsers extends EventState {
// //   List<UserModel> allEventsUsers;

// //   EventSuccessGitEventUsers({required this.allEventsUsers});
// // }

// // class EventSuccessGitEventMessages extends EventState {
// //   List<MessageModel> allEventsMessages;

// //   EventSuccessGitEventMessages({required this.allEventsMessages});
// // }
