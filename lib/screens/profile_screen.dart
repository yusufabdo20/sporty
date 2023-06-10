import 'package:flutter/material.dart';
import 'package:sporty/constanse.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static String id = 'MyProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
        
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 102,
              backgroundColor: Color.fromARGB(255, 83, 81, 81),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 101,
                backgroundImage: AssetImage(klogo),
              ),
            ),
            const Text(
              'Mostafa Mahmoud',
              style: TextStyle(
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
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Icon(
                        Icons.email,
                        size: 34,
                        color: Color.fromARGB(255, 15, 13, 13),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 22,
                        right: 20,
                      ),
                      child: Text(
                        'Email',
                        style: TextStyle(
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
      ),
    );
  }
}
