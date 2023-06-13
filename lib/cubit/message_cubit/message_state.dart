part of 'message_cubit.dart';

@immutable
abstract class MessageState {}

class MessageInitial extends MessageState {}
class MessageLoading extends MessageState {}
class MessageFaiulre extends MessageState {}
class MessageSuccess extends MessageState {}
