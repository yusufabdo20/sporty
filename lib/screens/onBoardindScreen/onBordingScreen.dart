import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../../services/local/cash.dart';
import '../SignInScreen/signin_screen.dart';
import '../SignUpScreen/signup_screen.dart';

class BoardingModel {
  String imagePath;
  String title;
  String body;
  BoardingModel({
    required this.imagePath,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardings = [
    BoardingModel(
        imagePath: 'assets/images/placeholder.png',
        title: "Your interests",
        body:
            "Our application suggests places and activities based on your interests , You can share your interested offer with your friends with your image."),
    BoardingModel(
        imagePath: 'assets/images/animat7mmsg.gif',
        title: "Reservation",
        body:
            "Users can easily reserve their preferred options directly through the application . Discover, reserve, and indulge in tailored experiences that match your interests."),
    BoardingModel(
      imagePath: 'assets/images/creative-brain.png',
      title: "Vendors Services",
      body: "Vendors showcase their services and products on our platform, providing users with a variety of options.",
    ),
  ];

  var boardingController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            buildTextJost(text: 'SPORTY', textColor: Colors.black, textSize: 20),
        actions: [
          TextButton(
              child: buildTextJost(
                  text: 'SKIP', textColor: rgbBahgaPurple3, textSize: 16),
              onPressed: () {
                submit();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: PageView.builder(
              controller: boardingController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildBoardingItem(boardings[index]),
              itemCount: boardings.length,
              onPageChanged: (value) {
                if (value == boardings.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                  // print("Is Last Ya man") ;
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          // const SizedBox(height: 50),
          Row(children: [
            SmoothPageIndicator(
              controller: boardingController, // PageController
              count: boardings.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 15,
                dotWidth: 15,
                expansionFactor: 3,
                spacing: 10,
                // dotColor: Colors.black54,
                // spacing:5.0,
                //  activeDotColor=defaultColor,
              ), // your preferred effect
              onDotClicked: (index) {},
            ),
            const Spacer(),
            FloatingActionButton(
              backgroundColor: rgbBahgaPurple3,
              onPressed: () {
                if (isLast == true) {
                  setState(() {
                    navigateTOAndReplacement(context,widget);
                  });
                  submit();
                } else {
                  boardingController.nextPage(
                      duration: const Duration(milliseconds: 752),
                      curve: Curves.fastLinearToSlowEaseIn);
                }
              },
              child: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ])
        ]),
      ),
    );
  }

  void submit() {
    Cash.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateTOAndReplacement(
          context,
          SignUpScreen(),
        );
      }
    });
  }

  Widget buildBoardingItem(BoardingModel boardingModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                // color: rgbBahgaPurple1,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.asset(
                boardingModel.imagePath,
                // width: 200,
                // height: 200,
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        buildTextJost(text: boardingModel.title, textSize: 28),
        const SizedBox(
          height: 10,
        ),
        buildTextJostNormal(
            text: boardingModel.body, textSize: 18, textColor: rgbBahgaPurple2, textAlign: TextAlign.start),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
