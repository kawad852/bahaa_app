import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController emailCtrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Icon(
                      Icons.lock,
                      size: 80,
                    ),
                  ),
                  Text(
                    "Reset your password",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Enter your email and we will send you a link to reset your password.",
                    ),
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: emailCtrl,
                    hintText: "البريد الالكتروني",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        // controller.resetPassword(email: emailCtrl.text.trim(), context: context);
                      }
                    },
                    child: const Text("Send"),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Back"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
