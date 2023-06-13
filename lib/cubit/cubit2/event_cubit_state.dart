part of 'event_cubit_cubit.dart';

@immutable
abstract class EventCubitState {}

class EventCubitInitial extends EventCubitState {}


class EventCubitSuccess extends EventCubitState {
  final List<EventsModel> event;
  final List<MessageModel> messages;
  final List<UserModel> user;
  EventCubitSuccess({required this.messages, required this.event,required this.user});
}

