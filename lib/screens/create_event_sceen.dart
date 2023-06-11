import 'package:flutter/material.dart';
import 'package:sporty/widgets/custom_button.dart';
import 'package:sporty/widgets/custom_text_field.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});
  static String id = 'create_event_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create event')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomformTextField(
              label: Text('Event title'),
              prefixIcon: Icon(Icons.emoji_events_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            CustomformTextField(
              label: Text(DateTime.now().toString()),
              prefixIcon: Icon(Icons.date_range),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonTo: "Submit",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
