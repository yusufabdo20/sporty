import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporty/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final String userEmail;

  ProfileScreen({required this.userEmail});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? userProfile;

  @override
  void initState() {
    super.initState();
    getUserProfile(widget.userEmail);
  }

  Future<void> getUserProfile(String userEmail) async {
    final userQuerySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .limit(1)
        .get();

    if (userQuerySnapshot.docs.isNotEmpty) {
      final userDoc = userQuerySnapshot.docs.first;
      final userData = userDoc.data() as Map<String, dynamic>;
      final name = userData['name'] as String;
      final email = userData['email'] as String;
      final userImage = userData['userImage'] as String;

      setState(() {
        userProfile = User(
          name: name,
          email: email,
          userImage: userImage,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userProfile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
             CircleAvatar(
              radius: 102,
              backgroundColor: const Color.fromARGB(255, 83, 81, 81),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 101,
                child: Image(image: AssetImage(userProfile!.userImage)),
              ),
            ),
             Text(
              userProfile!.name,
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
                child:  Row(
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
                        userProfile!.email,
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
    );
  }
}
