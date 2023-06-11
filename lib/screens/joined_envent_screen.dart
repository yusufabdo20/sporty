import 'package:flutter/material.dart';
import 'package:sporty/screens/chat_screen.dart';
import 'package:sporty/widgets/custom_joined_event.dart';

class MyJoinedScreen extends StatelessWidget {
  const MyJoinedScreen({super.key});
  static String id = 'MyJoinedScreen';

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Joined Event'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChatScreen.id,
                            arguments: email);
                      },
                      child: CustomJoinedEvent(
                          eventName: "Event name",
                          sportType: "Sport Type",
                          city: "city",
                          date: "Date of day",
                          time: "Time of day"),
                    ),
                    CustomJoinedEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomJoinedEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomJoinedEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomJoinedEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomJoinedEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomJoinedEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
