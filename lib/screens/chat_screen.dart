import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/message_cubit/message_cubit.dart';
import 'package:sporty/models/massage_model.dart';
import 'package:sporty/widgets/chat_buble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'chatScreen';

  TextEditingController controller = TextEditingController();

  final _controllar = ScrollController();
  // List<MessageModel> messagesList = [];
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String email = arguments['email'];
    final List<MessageModel> messagesList = arguments['messageList'];
    final String eventId = arguments['eventId'];

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: kPramairycolor,
        centerTitle: true,
        title: const Text('Event Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _controllar,
              itemCount: messagesList.length,
              itemBuilder: (context, index) {
                return messagesList[index].id == email
                    ? ChatBubel(
                        massage: messagesList[index],
                        email: messagesList[index].id,
                      )
                    : ChatBubelFriend(
                        massage: messagesList[index],
                        email: messagesList[index].id);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<MessageCubit>(context).addMessageToEvent(
                    message: data,
                    createdAt: DateTime.now().toString(),
                    email: email,
                    eventId: eventId);
                controller.clear();
                _controllar.animateTo(0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: IconButton(
                    onPressed: () {
                      BlocProvider.of<MessageCubit>(context).addMessageToEvent(
                          eventId: eventId,
                          message: controller.text,
                          createdAt: DateTime.now().toString(),
                          email: email);
                      controller.clear();
                      _controllar.animateTo(0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    color: kPramairycolor,
                    icon: const Icon(Icons.send),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kPramairycolor,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
