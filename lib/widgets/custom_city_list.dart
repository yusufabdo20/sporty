import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';

class CityList extends StatelessWidget {
  const CityList({super.key, required this.isActive, required this.city});
  final bool isActive;
  final String city;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              child: Text(
                city,
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
              radius: 28,
            ),
          )
        : const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 179, 191, 231),
            radius: 32,
          );
  }
}

class CityListView extends StatefulWidget {
  const CityListView({super.key});

  @override
  State<CityListView> createState() => _CityListViewState();
}

class _CityListViewState extends State<CityListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * 2,
      child: ListView.builder(
          itemCount: city.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<EventCubit>(context).city = city[index];
                  setState(() {});
                },
                child: CityList(
                  city: city[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
