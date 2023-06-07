
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
   EventItem({
    super.key,
    required this.eventName ,
    required this.sportType ,
    required this.city ,
    required this.date ,
    required this.time ,
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
          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Join"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.sports_score_outlined),
                  Text(
                    sportType,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_on_sharp),
                  Text(
                    city,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.date_range_rounded),
                      Text(
                        date,
                        style: TextStyle(
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
