import 'package:flutter/material.dart';
import 'package:flutterchatbot/components/my_button.dart';
import 'package:flutterchatbot/components/my_textfield.dart';


class LoginPage extends StatelessWidget{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 90,
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 25),

            //Message
            Text(
              "SuperChat",
              style: TextStyle(
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

            // not a memeber? register now
          ],
        ),
      ),
    );
  }
}