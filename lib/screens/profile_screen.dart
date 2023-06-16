import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/models/user_model.dart';
import 'package:sporty/widgets/profile_widget.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});
  static String id = 'MyProfileScreen';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    dynamic email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body:ProfileScreen(userEmail: email),
      // ModalProgressHUD(
      //   inAsyncCall: isLoading,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const CircleAvatar(
      //         radius: 102,
      //         backgroundColor: Color.fromARGB(255, 83, 81, 81),
      //         child: CircleAvatar(
      //           backgroundColor: Colors.white,
      //           radius: 101,
      //           child: Image(image: AssetImage('assets/images/football.png')),
      //         ),
      //       ),
      //       const Text(
      //         'Test Mail',
      //         style: TextStyle(
      //           fontSize: 30,
      //         ),
      //       ),
      //       const Text(
      //         'Welcome Back',
      //         style: TextStyle(
      //           fontSize: 20,
      //         ),
      //       ),
      //       const Divider(
      //         thickness: 1,
      //         indent: 70,
      //         endIndent: 70,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 16,
      //           vertical: 8,
      //         ),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //           height: 65,
      //           child: const Row(
      //             children: [
      //               Padding(
      //                 padding: EdgeInsets.only(right: 10, left: 10),
      //                 child: Icon(
      //                   Icons.email,
      //                   size: 34,
      //                   color: Color.fromARGB(255, 15, 13, 13),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(
      //                   left: 22,
      //                   right: 20,
      //                 ),
      //                 child: Text(
      //                   'test@mail.com',
      //                   style: TextStyle(
      //                     fontSize: 24,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
