import 'package:flutter/material.dart';
import 'package:flutterchatbot/components/my_button.dart';
import 'package:flutterchatbot/components/my_textfield.dart';
import 'package:flutterchatbot/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void register() {
    if (_formKey.currentState!.validate()) {
      // Your login logic here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset:
          true, // This allows the UI to adjust when the keyboard appears
      body: Center(
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 40), // Add some space at the top for safety

                //logo
                Image.asset(
                  'assets/gifs/bot.gif',
                  width: 190,
                  height: 190,
                ),

                const SizedBox(height: 25),

                //Message
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                const SizedBox(height: 25),

                //text field for email
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                //text field for password
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                MyTextfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                //button
                MyButton(text: 'Sign Up', onTap: register),

                const SizedBox(height: 10),

                // Already have an account? Login here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account?",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                    height: 40), // Add some space at the bottom for safety
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
