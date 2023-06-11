part of 'event_cubit.dart';

@immutable
abstract class ChatState {}

class EventInitial extends ChatState {}

class EventSuccess extends ChatState {
  List<EventModel> event;
  EventSuccess({required this.event});
}
