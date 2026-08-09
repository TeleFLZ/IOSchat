import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import 'chats_list.dart';
import 'contacts_tab.dart';
import 'profile_tab.dart';
import 'settings_screen.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ChatsList(),
    ContactsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Telegram'),
        trailing: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen())),
          child: Icon(Icons.settings_outlined, color: Colors.blue),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
