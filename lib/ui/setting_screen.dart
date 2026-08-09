import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), backgroundColor: Colors.blue),
      body: SwitchListTile(
        title: Text('Dark Theme'),
        value: state.isDarkMode,
        onChanged: (_) => state.toggleTheme(),
      ),
    );
  }
}
