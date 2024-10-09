import 'package:flutter/material.dart';

class MySmallButton extends StatelessWidget{
  final Function()? onTap;
  final String text;

  const MySmallButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        // child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold
              ),
          ),
        // ),
      ),
    );
  }
}