import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class ChatView extends StatefulWidget {
  final String chatName;
  ChatView({required this.chatName});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.chatName), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: state.messages.length,
              itemBuilder: (_, i) {
                final msg = state.messages[i];
                final isMe = msg['from'] == 'me';
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(msg['text'], style: TextStyle(color: isMe ? Colors.white : Colors.black)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Message...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      state.sendMessage(_controller.text, widget.chatName);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
