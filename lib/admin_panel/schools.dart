import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:bahaa_app/utils/my_error_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SchoolsPanel extends StatefulWidget {
  const SchoolsPanel({Key? key}) : super(key: key);

  @override
  State<SchoolsPanel> createState() => _SchoolsPanelState();
}

class _SchoolsPanelState extends State<SchoolsPanel> {
  final _collection = FirebaseFirestore.instance.collection("schools");
  late FocusNode _focusNode;

  final _fields = [
    SchoolField(title: "إسم المدرسة", controller: TextEditingController()),
    SchoolField(title: "العنوان", controller: TextEditingController()),
    SchoolField(title: "خط الطول", controller: TextEditingController()),
    SchoolField(title: "خط العرض", controller: TextEditingController()),
  ];

  void _clearFields() {
    for (var element in _fields) {
      element.controller.clear();
    }
    _focusNode.requestFocus();
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _fields) {
      element.controller.dispose();
    }
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
              "المدارس",
              style: Theme.of(context).textTheme.headline3,
            ),
            ..._fields.map((element) {
              final index = _fields.indexOf(element);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextField(
                  focusNode: index == 0 ? _focusNode : null,
                  controller: element.controller,
                  hintText: element.title,
                  height: 80,
                ),
              );
            }).toList(),
            const SizedBox(
              height: 50,
            ),
            CustomElevatedButton(
              onTap: () async {
                var checkFields = _fields[0].controller.text.isEmpty || _fields[1].controller.text.isEmpty || _fields[2].controller.text.isEmpty || _fields[3].controller.text.isEmpty;
                if (checkFields) {
                  Fluttertoast.showToast(msg: "جميع الحقول مطلوبة");
                  return;
                } else {
                  Loader.show(context);
                  await _collection.add({
                    "name": _fields[0].controller.text,
                    "address": _fields[1].controller.text,
                    "longitude": _fields[2].controller.text,
                    "latitude": _fields[3].controller.text,
                    "time": DateTime.now(),
                  }).catchError((onError) {
                    MyErrorDialog.showErrorDialog(context);
                  });
                  _clearFields();

                  Loader.hide();
                  Fluttertoast.showToast(msg: "تم إضافة الطالب");
                }
              },
              title: "إضافة",
            ),
          ],
        ),
      ),
    );
  }
}

class SchoolField {
  final TextEditingController controller;
  final String title;

  SchoolField({required this.title, required this.controller});
}
