import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/auth_cubit/auth_cubit.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key, required this.isActive, required this.image});
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              child: Container(child: Image.asset(image.toString())),
              radius: 26,
            ),
          )
        : CircleAvatar(
            child: Container(child: Image.asset(image.toString())),
            radius: 30,
          );
  }
}

class ImagesListView extends StatefulWidget {
  const ImagesListView({super.key});

  @override
  State<ImagesListView> createState() => _ImagesListViewState();
}

class _ImagesListViewState extends State<ImagesListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * 2,
      child: ListView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AuthCubit>(context).image = images[index];
                  setState(() {});
                },
                child: ImageList(
                  image: images[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
