import 'package:flutter/material.dart';

class CustomJoinedEvent extends StatelessWidget {
  CustomJoinedEvent({
    super.key,
    required this.eventName,
    required this.sportType,
    required this.city,
    required this.date,
    required this.time,
  });
  String eventName;
  String sportType;
  String city;
  String date;
  String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: Colors.blue,
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
                eventName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Deleat",style: TextStyle(color: Colors.red),),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("unjoin",style: TextStyle(color: Colors.greenAccent),),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(Icons.sports_score_outlined),
                  Text(
                    sportType,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  Text(
                    city,
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
                        date,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Text(time),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
