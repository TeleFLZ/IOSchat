import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.telegram, size: 70, color: Colors.blue),
            SizedBox(height: 30),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<AppState>(context, listen: false).login(_controller.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeTab()));
                }
              },
              child: SizedBox(width: double.infinity, child: Center(child: Text('Sign In', style: TextStyle(color: Colors.white)))),
            ),
          ],
        ),
      ),
    );
  }
}
