import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());
  final CollectionReference events =
      FirebaseFirestore.instance.collection('events');

  void addMessageToEvent({
    required String eventId,
    required String message,
    required String createdAt,
    required String email,
  }) {
    emit(MessageLoading());
    try {
      final eventRef = events.doc(eventId);
      final messagesCollection = eventRef.collection('messages');

      messagesCollection.add({
        'message': message,
        'createdAt': DateTime.now(),
        'email': email,
      });
      emit(MessageSuccess());
    } catch (e) {
          emit(MessageFaiulre());
;
    }
  }
}
