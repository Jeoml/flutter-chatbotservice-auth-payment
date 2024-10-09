import 'package:flutter/material.dart';

class MyPaymentButton extends StatelessWidget{
  final Function()? onTap;
  final String image;

  const MyPaymentButton({
    super.key,
    required this.image,
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
        child: Center(
          // child: Text(
          //   text,
          //   style: const TextStyle(
          //     fontSize: 17, fontWeight: FontWeight.bold
          //     ),
          // ),
          child: Image.asset(image, width: 100, height: 50, fit: BoxFit.fill),
        ),
      ),
    );
  }
}