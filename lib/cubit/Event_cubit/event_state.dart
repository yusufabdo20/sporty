part of 'event_cubit.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventFailure extends EventState {}

class EventSuccess extends EventState {}

class EventSuccessWithList extends EventState {
  List<EventsModel> events = [];

  EventSuccessWithList(List<Map<String, dynamic>> allEvents);
}
