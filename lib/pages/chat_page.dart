import 'package:chatting_app/Services/Auth/auth_service.dart';
import 'package:chatting_app/Services/Chat/chat_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiversID;
  final String receiversEmail;

  ChatPage({
    super.key,
    required this.receiversID,
    required this.receiversEmail,
  });

  //textcontroller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        receiversID,
        _messageController.text,
      );

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiversEmail),
      ),
    );
  }
}
