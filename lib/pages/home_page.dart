import 'package:chatting_app/Components/my_drawer.dart';
import 'package:chatting_app/Components/user_tile.dart';
import 'package:chatting_app/Services/Auth/auth_service.dart';
import 'package:chatting_app/Services/Chat/chat_service.dart';
import 'package:chatting_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //get current user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
      body: _builderUserList(),
    );
  }

  //build a list of users except current user

  Widget _builderUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        //return listview
        return ListView(
          children: snapshot.data!
              .map<Widget>(
                (userData) => _builderUserListItem(userData, context),
              )
              .toList(),
        );
      },
    );
  }

  //build individual listtile for user
  Widget _builderUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiversEmail: userData["email"],
                receiversID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
