import 'package:flutter/material.dart';

class MyJoinedScreen extends StatelessWidget {
  const MyJoinedScreen({super.key});
  static String id = 'MyJoinedScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Joined Event'),
        centerTitle: true,
        
      ),
    );
  }
}