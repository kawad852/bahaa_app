import 'package:bahaa_app/model/category.dart';
import 'package:bahaa_app/network/category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();

  late Future<CategoryModel?> categoryData;
  late CategoryModel? _categoryModel;

  Future<CategoryModel?> fetchCategoryData() async {
    _categoryModel = await CategoryApi.data();
    return _categoryModel;
  }

  @override
  void onInit() {
    categoryData = fetchCategoryData();
    super.onInit();
  }
}
