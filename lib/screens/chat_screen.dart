import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/message_cubit/message_cubit.dart';
import 'package:sporty/models/massage_model.dart';
import 'package:sporty/widgets/chat_buble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String id = 'chatScreen';
  // late String eventId;
  // late Function(String, String, String) addMessageToEvent;

  TextEditingController messageController = TextEditingController();

  // void submitMessage(String message, String userEmail) {
  //   // Invoke the addMessageToEvent method when the user submits a message
  //   addMessageToEvent(eventId, message, userEmail);

  //   // Clear the text field after submitting the message
  //   messageController.clear();
  // }

  final _controllar = ScrollController();
  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic> arguments =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // final String email = arguments['email'];
    final List<MessageModel> messagesList = [];
    // // eventId = arguments['eventId'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPramairycolor,
        centerTitle: true,
        title: const Text('Event Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Expanded(
              child: ListView(
                children: [
                  ChatBubel(
                    massage: 'Hi',
                    email: 'Welcom Message',
                  ),
                  ChatBubel(
                    massage: 'How Are you',
                    email: 'Welcome Message',
                  ),
                  // ChatBubelFriend(
                  //   massage: 'Fine',
                  //   email: 'Moo',
                  // ),
                ],
              ),
            ),
            // : ListView.builder(
            //     reverse: true,
            //     controller: _controllar,
            //     itemCount: messagesList.length,
            //     itemBuilder: (context, index) {
            //       return messagesList[index].id == 'email'
            //           ? ChatBubel(
            //               massage: messagesList[index].message,
            //               email: messagesList[index].id,
            //             )
            //           : ChatBubelFriend(
            //               massage: messagesList[index].message,
            //               email: messagesList[index].id);
            //     },
            //   ),
          ),
          Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Enter a message',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final message = messageController.text;
                      final userEmail =
                          'email'; // Replace with the actual user's email or a variable representing the user's email
                      // submitMessage(message, userEmail);
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              )
              // child: TextField(
              //   controller: controller,
              //   onSubmitted: (data) {
              //     BlocProvider.of<MessageCubit>(context).addMessageToEvent(
              //         message: data,
              //         createdAt: DateTime.now().toString(),
              //         email: email,
              //         eventId: eventId);
              //     controller.clear();
              //     _controllar.animateTo(0,
              //         duration: const Duration(seconds: 1),
              //         curve: Curves.fastLinearToSlowEaseIn);
              //   },
              //   decoration: InputDecoration(
              //       hintText: 'Send Message',
              //       suffixIcon: IconButton(
              //         onPressed: () {
              //           BlocProvider.of<MessageCubit>(context).addMessageToEvent(
              //               eventId: eventId,
              //               message: controller.text,
              //               createdAt: DateTime.now().toString(),
              //               email: email);
              //           controller.clear();
              //           _controllar.animateTo(0,
              //               duration: const Duration(seconds: 1),
              //               curve: Curves.fastLinearToSlowEaseIn);
              //         },
              //         color: kPramairycolor,
              //         icon: const Icon(Icons.send),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: const BorderSide(
              //             color: kPramairycolor,
              //           ))),
              // ),
              ),
        ],
      ),
    );
  }
}





// class ChatScreen extends StatelessWidget {
//   final String eventId;
//   final Function(String, String, String) addMessageToEvent;

//   ChatScreen({required this.eventId, required this.addMessageToEvent});

//   TextEditingController messageController = TextEditingController();

//   void submitMessage(String message, String userEmail) {
//     // Invoke the addMessageToEvent method when the user submits a message
//     addMessageToEvent(eventId, message, userEmail);

//     // Clear the text field after submitting the message
//     messageController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: Column(
//         children: [
//           // Chat messages display
//           // ...

//           // Text field for entering a message
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: messageController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter a message',
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   final message = messageController.text;
//                   final userEmail = 'user@example.com'; // Replace with the actual user's email or a variable representing the user's email
//                   submitMessage(message, userEmail);
//                 },
//                 icon: Icon(Icons.send),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

