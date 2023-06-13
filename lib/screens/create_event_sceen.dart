import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/auth_cubit/auth_cubit.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';
import 'package:sporty/models/user_model.dart';
import 'package:sporty/widgets/custom_button.dart';
import 'package:sporty/widgets/custom_city_list.dart';
import 'package:sporty/widgets/custom_text_field.dart';

class CreateEventScreen extends StatefulWidget {
  CreateEventScreen({super.key});
  static String id = 'create_event_screen';

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  String? eventName;

  String? sportType;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    dynamic email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('Create event')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomformTextField(
                hintText: 'Event Name',
                label: const Text('Event Name'),
                prefixIcon: const Icon(Icons.sports_score),
                onChange: (v) {
                  eventName = v;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomformTextField(
                hintText: 'sport Type',
                label: const Text('sport Type'),
                prefixIcon: const Icon(Icons.type_specimen),
                onChange: (v) {
                  sportType = v;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const CityListView(),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                buttonTo: 'Create Event',
                onTap: () {
                  BlocProvider.of<EventCubit>(context).createEvent(
                    eventName: eventName!,
                    sportType: sportType!,
                    userEmail: email,
                    userAdmin: true,
                  );
                  Navigator.pop(context);
                  
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
