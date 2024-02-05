import 'package:flutter/material.dart';
import 'package:chat_app/colors.dart';
import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Welcome to Chat_App',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            Image.asset(
              'assets/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
            ),
            SizedBox(
              height: size.height / 15,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read out privacy. Tap "Agree and continue" to accept the Terms of Services.',
                style: TextStyle(
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(text: "AGREE AND CONTINUE", 
              onpressed: () => navigateToLoginScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
