import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Replace with user's profile image
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Hello, Joel',
                  style: TextStyle(
                    fontSize: 32,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[Colors.blue, Colors.pink],
                      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type, talk or share...',
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.grey[800],
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Add some spacing between TextField and buttons
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 250, 255, 1),
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(
                        color: Colors.grey.shade800,
                        width: 3.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mic, color: Colors.black),
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(width: 0),
                        // Add other icons here if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
