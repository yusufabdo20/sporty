import 'package:flutter/material.dart';
import 'package:sporty/models/event_model.dart';

class JoinedCustomEvent extends StatelessWidget {
  JoinedCustomEvent({super.key, required this.event, required this.email});
  EventModel event;
  String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 64, 116),
            width: 2.0,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                event.eventName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              event.users.userName == email
                  ? TextButton(
                      onPressed: () {},
                      child: const Text("delete"),
                    )
                  : const Text(''),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(Icons.sports_score_outlined),
                  Text(
                    event.sportType,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  Text(
                    event.city,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range_rounded),
                      Text(
                        event.date,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
