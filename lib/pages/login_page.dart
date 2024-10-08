import 'package:flutter/material.dart';
import 'package:flutterchatbot/components/my_button.dart';
import 'package:flutterchatbot/components/my_textfield.dart';


class LoginPage extends StatefulWidget{
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              'assets/gifs/bot.gif',
              width: 190,
              height: 190,
            ),
            // Icon(
            //   Icons.lock_open_rounded,
            //   size: 90,
            //   color: Theme.of(context).colorScheme.secondary,
            // ),

            const SizedBox(height: 25),

            //Message
            Text(
              "Welcome to SuperChat",
              style: TextStyle(
                fontFamily: 'Roboto-Regular.ttf',
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              )
            ),

            const SizedBox(height: 25),

            //text field for email
            MyTextfield(
              controller: emailController,
              hintText: 'Enter your Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //text field for password
            MyTextfield(
              controller: passwordController,

              hintText: 'Enter your Password',
              obscureText: true,
            ),

            const SizedBox(height: 15),

            //button
            MyButton(text: 'Sign In', onTap: (){}),

            const SizedBox(height: 10),

            // not a memeber? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(width: 4),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
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