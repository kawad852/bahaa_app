import 'package:bahaa_app/binding/registration/sign_in.dart';
import 'package:bahaa_app/ui/screens/registration/sign_in.dart';
import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController confirmPasswordCtrl;

  final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordRegExp = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
  // final usernameRegExp = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    confirmPasswordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
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
                  BaseImages.logo,
                  height: 150,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Sign up",
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
                    } else if (!emailRegExp.hasMatch(value)) {
                      return "invalid email".tr;
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomTextField(
                    controller: passwordCtrl,
                    label: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your password".tr;
                      } else if (value.length < 6) {
                        return "password must be more than 5 characters".tr;
                      } else if (!passwordRegExp.hasMatch(value)) {
                        return "invalid password".tr;
                      }
                      return null;
                    },
                  ),
                ),
                CustomTextField(
                  controller: confirmPasswordCtrl,
                  label: "Confirm password",
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Confirm your password".tr;
                    } else if (value != confirmPasswordCtrl.text) {
                      return "password does not match".tr;
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        // controller.resetPassword(email: emailCtrl.text.trim(), context: context);
                      }
                    },
                    child: const Text("Sign up"),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Already have an account ?",
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(
                          () => const SignInScreen(),
                          binding: SignInBinding(),
                        );
                      },
                      child: const Text("Sign in"),
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
