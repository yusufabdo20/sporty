import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sporty/models/massage_model.dart';

import '../../constanse.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference massage =
      FirebaseFirestore.instance.collection(kMassagesCollections);
  void sendMessage({required String message, required String email}) {
    try {
      massage.add(
        {
          kMassage: message,
          kCreatedAt: DateTime.now(),
          uniqId: email,
        },
      );
    } on Exception catch (e) {}
  }

  void getMessages() {
    massage.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<MessageModel> messagesList = [];
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
