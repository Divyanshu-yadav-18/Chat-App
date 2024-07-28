import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiversEmail;

  const ChatPage({
    super.key,
    required this.receiversEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(receiversEmail),
    ));
  }
}
