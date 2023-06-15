import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';
import 'package:sporty/helper/show-snack-bar.dart';
import 'package:sporty/models/event_model.dart';
import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';
import 'package:sporty/screens/chat_screen.dart';
import 'package:sporty/widgets/custom_event_item.dart';
import 'package:sporty/widgets/custom_joined_event.dart';

class MyJoinedScreen extends StatelessWidget {
  MyJoinedScreen({super.key});
  static String id = 'MyJoinedScreen';
  bool isLoading = false;
  List<EventsModel> eventsList = [];
  List<UserModel> userList = [];
  @override
  Widget build(BuildContext context) {
    dynamic email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Joined Event'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomJoinedEvent(
              eventName: "Running",
              sportType: "run",
              city: "Helwan",
              date: "Sunday",
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
            ),
            Expanded(
              child: BlocConsumer<EventCubit, EventState>(
                listener: (context, state) {
                  if (state is EventLoading) {
                    isLoading = true;
                  } else if (state is EventSuccessGitEvent) {
                    eventsList = state.allEvents;
                    isLoading = false;
                  } else if (state is EventFailure) {
                    scafoldmassage(context, 'have an erorr');
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: isLoading,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListView.builder(
                        itemCount: eventsList.length,
                        itemBuilder: (context, index) {
                          EventsModel event = eventsList[index];
                         
                          bool joined = true;
                          for (var userEmail in userList) {
                            if (userEmail == email) {
                              joined = false;
                              break;
                            }
                          }
                          return !joined
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ChatScreen.id,
                                      arguments: {
                                        'email': email,
                                        'messageList':
                                            eventsList[index].messages,
                                        'eventId': eventsList[index].eventId,
                                      },
                                    );
                                  },
                                  child: CustomJoinedEvent(
                                      eventName: eventsList[index].eventName,
                                      sportType: eventsList[index].sportType,
                                      city: eventsList[index].city,
                                      date: eventsList[index].date,
                                      onPressed: () {
                                        if (true) {
                                          BlocProvider.of<EventCubit>(
                                                  context) //
                                              .deleteEvent(
                                                  eventsList[index].eventId);
                                          // } else(false) {
                                          //   scafoldmassage(context,
                                          //       'to delete this event you must be Event Admin and you aren\'t');
                                          // }
                                        }
                                      }),
                                )
                              : CustomItemEvent(
                                  eventName: "Event name",
                                  sportType: "Sport Type",
                                  city: "city",
                                  date: "Date of day",
                                  onPressed: () {},
                                );
                        },

                        // CustomItemEvent(
                        //     eventName: "Event name",
                        //     sportType: "Sport Type",
                        //     city: "city",
                        //     date: "Date of day",
                        //     time: "Time of day"),
                        //   CustomItemEvent(
                        //       eventName: "Event name",
                        //       sportType: "Sport Type",
                        //       city: "city",
                        //       date: "Date of day",
                        //       time: "Time of day"),
                        //   CustomItemEvent(
                        //       eventName: "Event name",
                        //       sportType: "Sport Type",
                        //       city: "city",
                        //       date: "Date of day",
                        //       time: "Time of day"),
                        //   CustomItemEvent(
                        //       eventName: "Event name",
                        //       sportType: "Sport Type",
                        //       city: "city",
                        //       date: "Date of day",
                        //       time: "Time of day"),
                        //   CustomItemEvent(
                        //       eventName: "Event name",
                        //       sportType: "Sport Type",
                        //       city: "city",
                        //       date: "Date of day",
                        //       time: "Time of day"),
                        //   CustomItemEvent(
                        //       eventName: "Event name",
                        //       sportType: "Sport Type",
                        //       city: "city",
                        //       date: "Date of day",
                        //       time: "Time of day"),
                        //   CustomItemEvent(
                        //       eventName: "Event name",
                        //       sportType: "Sport Type",
                        //       city: "city",
                        //       date: "Date of day",
                        //       time: "Time of day"),
                        // ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
