import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';
import 'package:sporty/cubit/user_cubit/user_cubit.dart';
import 'package:sporty/helper/show-snack-bar.dart';
import 'package:sporty/models/event_model.dart';
import 'package:sporty/models/user_model.dart';
import 'package:sporty/screens/create_event_sceen.dart';
import 'package:sporty/screens/joined_envent_screen.dart';
import 'package:sporty/screens/profile_screen.dart';

import '../widgets/custom_event_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  bool isLoading = false;
  static String id = 'homeScreen';
  List<EventsModel> eventsList = [];
  List<UserModel> usersList = [];

  @override
  Widget build(BuildContext context) {
    dynamic email = ModalRoute.of(context)!.settings.arguments;

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
            Expanded(
              child: BlocConsumer<EventCubit, EventState>(
                listener: (context, state) {
                  if (state is EventLoading) {
                    isLoading = true;
                  } else if (state is EventSuccessWithList) {
                    eventsList = state.events;
                    isLoading = false;
                  } else if (state is EventFailure) {
                    scafoldmassage(context, 'have an erorr');
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: isLoading, child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListView.builder(
                        itemCount: eventsList.length,
                        itemBuilder: (context, index) {
                          EventsModel event = eventsList[index];
                          if (eventsList[index].users.userEmail != email) {
                            return CustomItemEvent(
                              eventName: event.eventName,
                              sportType: event.sportType,
                              city: event.city,
                              date: event.date,
                              onPressed: () {
                                BlocProvider.of<UserCubit>(context)
                                    .addUserToEvent(
                                  userEmail: email,
                                  userAdmin: false,
                                  eventId: event.eventId,
                                );
                              },
                            );
                          } else {
                            return const Center();
                          }
                        },
                      ),
                    ),
                  );
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
              icon: const Icon(Icons.event_available),
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
