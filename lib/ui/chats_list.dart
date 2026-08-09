import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import 'chat_view.dart';

class ChatsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      itemCount: state.chats.length,
      itemBuilder: (_, i) {
        final chat = state.chats[i];
        return ListTile(
          leading: CircleAvatar(child: Text(chat['name'][0])),
          title: Text(chat['name'], style: TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(chat['last']),
          trailing: chat['unread'] > 0
              ? CircleAvatar(radius: 12, backgroundColor: Colors.blue, child: Text('${chat['unread']}', style: TextStyle(fontSize: 12, color: Colors.white)))
              : null,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatView(chatName: chat['name']))),
        );
      },
    );
  }
}
