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
  bool isLoading =false;
  List<EventsModel> eventsList = [];
  List<MessageModel> massageList = [];
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
                    inAsyncCall: isLoading,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          if (eventsList[index].users.userEmail == email) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ChatScreen.id,
                                  arguments: {
                                    'email': email,
                                    'messageList': eventsList[index].messages,
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
                                  if (eventsList[index].users.userAdmin) {
                                    BlocProvider.of<EventCubit>(context) //
                                        .deleteEvent(eventsList[index].eventId);
                                  } else {
                                    scafoldmassage(context,
                                        'to delete this event you must be Event Admin and you aren\'t');
                                  }
                                },
                              ),
                            );
                          } else {
                            return const Center();
                          }
                        },
                        // children: [
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
