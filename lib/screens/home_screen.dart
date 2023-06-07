import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_event_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            EventItem(
                eventName: "Event name",
                sportType: "Sport Type",
                city: "city",
                date: "Date of day",
                time: "Time of day"),
          ],
        ),
      ),
    );
  }
}
