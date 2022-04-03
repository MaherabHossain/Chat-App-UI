import 'package:chat_app/screens/ChatScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatScreen(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'CHATS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work), label: 'CHANNELS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'PROFILE'),
        ],
      ),
    );
  }
}
