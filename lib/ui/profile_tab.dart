import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, child: Text(state.currentUsername[0].toUpperCase(), style: TextStyle(fontSize: 30))),
          SizedBox(height: 12),
          Text('@${state.currentUsername}', style: TextStyle(fontSize: 22)),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => state.logout(),
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}
