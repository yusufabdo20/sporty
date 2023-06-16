import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';
import 'package:sporty/screens/create_event_sceen.dart';
import 'package:sporty/screens/joined_envent_screen.dart';
import 'package:sporty/screens/profile_screen.dart';

import '../widgets/custom_event_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String email = '';
  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().getEventsNotJoinedByUser(email);
    // Pass the user's email to the function
  }

  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateEventScreen.id,
                arguments: email);
          },
          icon: const Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onSubmitted: (data) {},
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    color: kPramairycolor,
                    icon: const Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: kPramairycolor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<EventCubit, EventState>(
                builder: (context, state) {
                  // Access the event state and handle different cases
                  if (state is EventLoading) {
                    // Handle loading state
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is EventSuccessNotJoined) {
                    // Handle success state
                    final events = state.events;
                    // Render the event list using the events data
                    return ListView.builder(
                      itemCount: events!.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return CustomItemEvent(
                          eventName: event.eventName,
                          sportType: event.sportType,
                          city: event.city,
                          date: event.date,
                          onPressed: () {
                            final eventCubit = context.read<EventCubit>();
                            eventCubit.joinEvent(event.id, email);
                          },
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 223, 232, 238),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyJoinedScreen.id,
                    arguments: email);
              },
              icon: const Icon(Icons.chat_bubble_outline_rounded),
            ),
            label: 'My Joined Events',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () async {
                Navigator.pushNamed(context, MyProfileScreen.id,
                    arguments: email);
              },
              icon: const Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
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
