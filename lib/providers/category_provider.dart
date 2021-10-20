import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/category.dart';

class CategoryProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Category> categories = [];

  addCategory(Category category) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('trackui_key');
    if (catString != null) {
      categories = Category.decode(catString);
    }
    categories.add(category);
    final String catObj = Category.encode(categories);
    await prefs.setString('trackui_key', catObj);
  }

  deleteCategory(id) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('trackui_key');
    if (catString != null) {
      categories = Category.decode(catString);
    }
    categories.removeWhere((element) => element.id == id);
    final String catObj = Category.encode(categories);
    await prefs.setString('trackui_key', catObj);
  }

  editCategory(Category categoryObj) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('trackui_key');
    if (catString != null) {
      categories = Category.decode(catString);
    }
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].id == categoryObj.id) {
        categories[i].name = categoryObj.name;
        categories[i].description = categoryObj.description;
        categories[i].weight = categoryObj.weight;
      }
    }
    // categories.add(category);
    final String catObj = Category.encode(categories);
    await prefs.setString('trackui_key', catObj);
  }
}
