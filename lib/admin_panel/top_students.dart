import 'dart:math';

import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:bahaa_app/utils/my_error_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Gender { male, female }

class TopStudentsPanel extends StatefulWidget {
  const TopStudentsPanel({Key? key}) : super(key: key);

  @override
  State<TopStudentsPanel> createState() => _TopStudentsPanelState();
}

class _TopStudentsPanelState extends State<TopStudentsPanel> {
  final _collection = FirebaseFirestore.instance.collection("top students");
  Gender? _gender;
  late TextEditingController nameCtrl;
  late TextEditingController gradeCtrl;
  late FocusNode _focusNode;
  final _random = Random();

  void _clearFields() {
    nameCtrl.clear();
    gradeCtrl.clear();
    _focusNode.requestFocus();
    setState(() {
      _gender = null;
    });
  }

  int _generateImageNum(String gender) {
    if (gender == "male") {
      var number = 0 + _random.nextInt(6 - 0);
      return number;
    } else {
      var number = 6 + _random.nextInt(12 - 6);
      return number;
    }
  }

  int _generateColorNum() {
    int num = _random.nextInt(3);
    return num;
  }

  @override
  void initState() {
    nameCtrl = TextEditingController();
    gradeCtrl = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    gradeCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "الطلاب الأوائل",
              style: Theme.of(context).textTheme.headline3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextField(
                focusNode: _focusNode,
                controller: nameCtrl,
                hintText: "إسم الطالب",
                height: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextField(
                keyboardType: TextInputType.number,
                controller: gradeCtrl,
                hintText: "المعدل",
                height: 80,
              ),
            ),
            ListTile(
              title: const Text('ذكر'),
              leading: Radio<Gender>(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('أنثى'),
              leading: Radio<Gender>(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              title: "إضافة",
              onTap: () async {
                if (nameCtrl.text.isEmpty || gradeCtrl.text.isEmpty || _gender == null) {
                  Fluttertoast.showToast(msg: "جميع الحقول مطلوبة");
                  return;
                }
                Loader.show(context);
                await _collection.add({
                  "name": nameCtrl.text,
                  "grade": gradeCtrl.text,
                  "image": _generateImageNum(_gender!.name).toString(),
                  "time": DateTime.now(),
                  "color": _generateColorNum().toString(),
                }).catchError((onError) {
                  MyErrorDialog.showErrorDialog(context);
                });
                Fluttertoast.showToast(msg: "تم إضافة الطالب");
                _clearFields();
                Loader.hide();
              },
            ),
          ],
        ),
      ),
    );
  }
}
