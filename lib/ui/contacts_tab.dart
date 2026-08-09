import 'package:flutter/material.dart';

class ContactsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ['Alice', 'Bob', 'Charlie', 'Diana']
          .map((name) => ListTile(
                leading: CircleAvatar(child: Text(name[0])),
                title: Text(name),
                trailing: Icon(Icons.message, color: Colors.blue),
              ))
          .toList(),
    );
  }
}
