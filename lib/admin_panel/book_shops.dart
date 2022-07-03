import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:bahaa_app/utils/my_error_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BookShopsPanel extends StatefulWidget {
  const BookShopsPanel({Key? key}) : super(key: key);

  @override
  State<BookShopsPanel> createState() => _BookShopsPanelState();
}

class _BookShopsPanelState extends State<BookShopsPanel> {
  final _collection = FirebaseFirestore.instance.collection("bookshops");
  late FocusNode _focusNode;

  final _fields = [
    BookShopsField(title: "المدينة", controller: TextEditingController()),
    BookShopsField(title: "الإسم", controller: TextEditingController()),
    BookShopsField(title: "العنوان", controller: TextEditingController()),
    BookShopsField(title: "الهاتف", controller: TextEditingController()),
  ];

  final _cities = [
    "عمان",
    "إربد",
    "الزرقاء",
    "الرصيفة",
    "السلط",
    "الطفيلة",
    "العقبة",
    "الفحيص",
    "المفرق",
    "جرش",
    "مأدبا",
    "معان",
    "عجلون",
    "الكرك",
    "الكرك",
    "الرمثا",
    "الأغوار",
    "ماحص",
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
              "المكتبات",
              style: Theme.of(context).textTheme.headline3,
            ),
            ..._fields.map((element) {
              final index = _fields.indexOf(element);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextField(
                  keyboardType: index == 3 ? TextInputType.phone : null,
                  onTap: index == 0
                      ? () {
                          Get.defaultDialog(
                            title: "المدينة",
                            content: SizedBox(
                              width: 300,
                              height: 500,
                              child: ListView.builder(
                                itemCount: _cities.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      _fields[0].controller.text = _cities[index];
                                      Get.back();
                                    },
                                    leading: Text(_cities[index]),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      : null,
                  readOnly: index == 0 ? true : false,
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
                var checkFields = _fields[0].controller.text.isEmpty || _fields[1].controller.text.isEmpty || _fields[2].controller.text.isEmpty;
                if (checkFields) {
                  Fluttertoast.showToast(msg: "جميع الحقول مطلوبة");
                  return;
                } else {
                  Loader.show(context);
                  await _collection.doc(_fields[0].controller.text).collection("libraries").add({
                    "name": _fields[1].controller.text,
                    "address": _fields[2].controller.text,
                    "phone": _fields[3].controller.text,
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

class BookShopsField {
  final TextEditingController controller;
  final String title;

  BookShopsField({required this.title, required this.controller});
}
