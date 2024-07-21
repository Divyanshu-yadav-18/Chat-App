import 'package:chatting_app/Components/my_button.dart';
import 'package:chatting_app/Components/mytextfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailContriller = TextEditingController();
  final TextEditingController _pwContriller = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(
              height: 50,
            ),

            Text(
              'Welcome Back, You have been missed',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            const SizedBox(
              height: 25,
            ),

            Mytextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailContriller,
            ),

            const SizedBox(
              height: 25,
            ),

            Mytextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwContriller,
            ),
            const SizedBox(
              height: 10,
            ),

            MyButton(
              text: 'Login',
              onTap: login,
            ),

            const SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register Now?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
