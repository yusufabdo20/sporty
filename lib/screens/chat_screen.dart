import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/chat_cubit/chat_cubit.dart';
import 'package:sporty/models/massage_model.dart';
import 'package:sporty/widgets/chat_buble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'chatScreen';

  TextEditingController controller = TextEditingController();

  final _controllar = ScrollController();
  List<MessageModel> messagesList = [];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPramairycolor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              klogo,
              width: 60,
            ),
            const Text('Event Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagesList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: _controllar,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubel(
                            massage: messagesList[index],
                          )
                        : ChatBubelFriend(massage: messagesList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email.toString());
                controller.clear();
                _controllar.animateTo(0,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: const Icon(
                    color: kPramairycolor,
                    Icons.send,
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
