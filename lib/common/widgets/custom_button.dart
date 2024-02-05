
import 'package:flutter/material.dart';
import 'package:chat_app/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButton({Key? key, required this.text,required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          // primary: tabColor,
          backgroundColor: tabColor,
          minimumSize: const Size(double.infinity, 50)
        ),
        child: Text(
          text,
          style: const TextStyle(color: blackColor),
        ));
  }
}
