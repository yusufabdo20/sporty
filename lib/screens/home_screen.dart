import 'package:flutter/material.dart';
import 'package:sporty/screens/create_event_sceen.dart';
import 'package:sporty/screens/joined_envent_screen.dart';
import 'package:sporty/screens/profile_screen.dart';

import '../widgets/custom_event_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CreateEventScreen.id,
                  arguments: email);
            },
            icon: const Icon(
              Icons.add,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListView(
                  children: [
                    CustomItemEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomItemEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomItemEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomItemEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomItemEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomItemEvent(
                        eventName: "Event name",
                        sportType: "Sport Type",
                        city: "city",
                        date: "Date of day",
                        time: "Time of day"),
                    CustomItemEvent(
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
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 223, 232, 238),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyJoinedScreen.id,
                        arguments: email);
                  },
                  icon: const Icon(Icons.event_available)),
              label: "My Joined Events",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyProfileScreen.id,
                        arguments: email);
                  },
                  icon: const Icon(Icons.person)),
              label: "Profile",
            ),
          ]),
    );
  }
}
