import 'dart:io';

import 'package:bahaa_app/controller/registration/sign_in.dart';
import 'package:bahaa_app/ui/screens/registration/reset_password.dart';
import 'package:bahaa_app/ui/screens/registration/sign_up.dart';
import 'package:bahaa_app/ui/widgets/custom_devider.dart';
import 'package:bahaa_app/ui/widgets/custom_social_button.dart';
import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  MyImages.logo,
                  height: 150,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Spacer(),
                  ],
                ),
                CustomTextField(
                  controller: emailCtrl,
                  label: "Email",
                  prefixIcon: const Icon(Icons.mail),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your email".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordCtrl,
                  label: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your password".tr;
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => const ResetPasswordScreen());
                      },
                      child: const Text("Forgot Password ?"),
                    ),
                    const Spacer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        SignInController().fetchSignInData(
                          email: emailCtrl.text.trim(),
                          password: passwordCtrl.text.trim(),
                          context: context,
                        );
                      }
                    },
                    child: const Text("Sign in"),
                  ),
                ),
                const CustomDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialButton(
                      isGoogle: true,
                      color: Colors.white,
                      onTap: () {},
                    ),
                    CustomSocialButton(
                      icon: FontAwesomeIcons.facebookF,
                      color: MyColors.facebook,
                      onTap: () {},
                    ),
                    if (Platform.isIOS)
                      CustomSocialButton(
                        icon: FontAwesomeIcons.apple,
                        color: Colors.black,
                        onTap: () {},
                      ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Text(
                      "Don't have an account ?",
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
