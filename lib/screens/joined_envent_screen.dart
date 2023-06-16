import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';
import 'package:sporty/helper/show-snack-bar.dart';
import 'package:sporty/models/event_model.dart';
import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';
import 'package:sporty/screens/chat_screen.dart';
import 'package:sporty/widgets/custom_event_item.dart';
import 'package:sporty/widgets/custom_joined_event.dart';

class MyJoinedScreen extends StatefulWidget {
  MyJoinedScreen({super.key});
  static String id = 'MyJoinedScreen';

  @override
  State<MyJoinedScreen> createState() => _MyJoinedScreenState();
}

class _MyJoinedScreenState extends State<MyJoinedScreen> {
  late String email = ''; 
  @override
  void initState() {
    super.initState();
    final eventCubit = context.read<EventCubit>();
    eventCubit
        .getEventsJoinedByUser(email); // Pass the user's email to the function
  }

  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Joined Event'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<EventCubit, EventState>(
                builder: (context, state) {
                  // Access the event state and handle different cases
                  if (state is EventLoading) {
                    // Handle loading state
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is EventSuccessJoined) {
                    // Handle success state
                    final events = state.joinevents;
                    // Render the event list using the events data
                    return ListView.builder(
                      itemCount: events!.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ChatScreen.id,
                              arguments: {
                                'messageList': events[index].messages,
                                'eventId': events[index].id,
                                'email': email,
                              },
                            );
                          },
                          child: CustomJoinedEvent(
                            eventName: event.eventName,
                            sportType: event.sportType,
                            city: event.city,
                            date: event.date,
                            onPressed: () {
                              final eventCubit = context.read<EventCubit>();
                              eventCubit.deleteEvent(event.id, email);
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is EventFailure) {
                    // Handle failure state
                    return const Text('Failed to load events.');
                  } else {
                    // Handle initial or other states
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class MyComponent extends StatefulWidget {
//   @override
//   _MyComponentState createState() => _MyComponentState();
// }

// class _MyComponentState extends State<MyComponent> {
//   final EventCubit eventCubit = EventCubit();

//   @override
//   void initState() {
//     super.initState();

//     final userEmail = 'user@example.com'; // Replace with the actual user's email or a variable representing the user's email
//     eventCubit.getEventsNotJoinedByUser(userEmail);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Events Not Joined by Me'),
//       ),
//       body: BlocBuilder<EventCubit, EventState>(
//         bloc: eventCubit,
//         builder: (context, state) {
//           if (state is EventLoading) {
//             return CircularProgressIndicator();
//           } else if (state is EventSuccess) {
//             final events = state.events;
//             // Display the events not joined by the user
//             return ListView.builder(
//               itemCount: events.length,
//               itemBuilder: (context, index) {
//                 final event = events[index];
//                 return ListTile(
//                   title: Text(event.eventName),
//                   subtitle: Text(event.sportType),
//                   // Other event details...
//                 );
//               },
//             );
//           } else if (state is EventFailure) {
//             return Text('Failed to load events.');
//           } else {
//             return Text('No events found.');
//           }
//         },
//       ),
//     );
//   }
// }

