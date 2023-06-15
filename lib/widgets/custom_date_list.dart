import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';

class DateList extends StatelessWidget {
  const DateList({super.key, required this.isActive, required this.day});
  final bool isActive;
  final String day;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 28,
              child: Text(
                day,
                style: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 250, 248, 248)),
              ),
            ),
          )
        : CircleAvatar(
            backgroundColor: Color.fromARGB(255, 141, 152, 185),
            radius: 32,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 141, 152, 185),
              radius: 32,
              child: Text(
                day,
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
            ),
          );
  }
}

class DateListView extends StatefulWidget {
  const DateListView({super.key});

  @override
  State<DateListView> createState() => _DateListViewState();
}

class _DateListViewState extends State<DateListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * 2,
      child: ListView.builder(
          itemCount: day.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<EventCubit>(context).date = day[index];
                  setState(() {});
                },
                child: DateList(
                  day: day[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
