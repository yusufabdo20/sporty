import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/user_cubit/user_cubit.dart';
import 'package:sporty/helper/show-snack-bar.dart';
import 'package:sporty/models/user_model.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});
  static String id = 'MyProfileScreen';
  bool isLoading = false;
  List<UserModel> user =[];

  @override
  Widget build(BuildContext context) {
    dynamic email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserLoading) {
            isLoading = true;
          } else if (state is UserSuccessWithList) {
            user=state.user;
            isLoading = false;
          } else if (state is UserFailure) {
            scafoldmassage(context, 'have an erorr');
            isLoading = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 102,
                  backgroundColor: const Color.fromARGB(255, 83, 81, 81),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 101,
                    child: Image(image: AssetImage(user[0].userImage)),
                  ),
                ),
                Text(
                  user[0].userName,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  indent: 70,
                  endIndent: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 65,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Icon(
                            Icons.email,
                            size: 34,
                            color: Color.fromARGB(255, 15, 13, 13),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 22,
                            right: 20,
                          ),
                          child: Text(
                            user[0].userEmail,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
