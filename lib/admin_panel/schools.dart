import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SchoolAdmin extends StatefulWidget {
  const SchoolAdmin({Key? key}) : super(key: key);

  @override
  State<SchoolAdmin> createState() => _SchoolAdminState();
}

class _SchoolAdminState extends State<SchoolAdmin> {
  final _collection = FirebaseFirestore.instance.collection("المدارس");
  final List<Map<String, dynamic>> _fields = [
    {
      "title": "إسم المدرسة",
      "controller": TextEditingController(),
    },
    {
      "title": "العنوان",
      "controller": TextEditingController(),
    },
    {
      "title": "احداثي 1",
      "controller": TextEditingController(),
    },
    {
      "title": "احداثي 2",
      "controller": TextEditingController(),
    },
  ];

  @override
  void dispose() {
    for (var element in _fields) {
      element["controller"].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "المدارس",
            style: Theme.of(context).textTheme.headline3,
          ),
          ..._fields.map((element) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextField(
                controller: element["controller"],
                hintText: element["title"],
                height: 80,
              ),
            );
          }).toList(),
          const SizedBox(
            height: 50,
          ),
          CustomElevatedButton(
            onTap: () {
              _collection.add({
                "الإسم": _fields[0]["controller"].text,
                "العنوان": _fields[1]["controller"].text,
                "الإحداثيات": [_fields[2]["controller"].text, _fields[3]["controller"].text],
                "التاريخ": DateTime.now(),
              });
            },
            title: "إضافة",
          ),
        ],
      ),
    );
  }
}
