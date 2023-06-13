import 'package:flutter/material.dart';
import 'package:sporty/models/massage_model.dart';

class ChatBubel extends StatelessWidget {
  ChatBubel({super.key, required this.massage, required this.email});
  final MessageModel massage;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
          top: 16,
          bottom: 16,
          right: 12,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Color.fromARGB(255, 68, 137, 255),
        ),
        child: Column(
          children: [
            Text(
              massage.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChatBubelFriend extends StatelessWidget {
  ChatBubelFriend({super.key, required this.massage, required this.email});
  final MessageModel massage;
   final String email;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
          top: 16,
          bottom: 16,
          right: 12,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color.fromARGB(255, 117, 192, 226),
        ),
        child: Column(
          children: [
            Text(
              massage.message,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
