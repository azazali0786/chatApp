// import 'dart:ffi';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/colors.dart';
import 'package:chat_app/common/utils/utils.dart';
import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phonecontroller = TextEditingController();
  Country? country;
  @override
  void initState() {
    super.initState();
    // phonecontroller.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phonecontroller.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .singInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Fill out all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your phone number"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text('whatsApp will need to verify your number.'),
          const SizedBox(
            height: 10,
          ),
          TextButton(onPressed: pickCountry, child: const Text("Pick country")),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              if (country != null) Text('+${country!.phoneCode}'),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: size.width * 0.7,
                child: TextField(
                  controller: phonecontroller,
                  decoration: const InputDecoration(
                    hintText: 'phone number',
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: SizedBox(
              height: size.height * 0.52,
            ),
          ),
          SizedBox(
            width: 90,
            child: CustomButton(
              onpressed: sendPhoneNumber,
              text: 'Next',
            ),
          )
        ]),
      ),
    );
  }
}
