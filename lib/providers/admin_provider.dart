import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/admins.dart';

class AdminProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Admin> admins = [];

  addAdmin(Admin admin) async {
    final SharedPreferences prefs = await _prefs;
    final String? adminString = prefs.getString('admin_key');
    if (adminString != null) {
      // admins = Admin.decode(adminString);
      admins = jsonDecode(adminString);
    }
    admins.add(admin);
    //final String adminObj = Admin.encode(admins);
    final String adminObj = jsonEncode(admins);
    await prefs.setString('admin_key', adminObj);
  }

  deleteadmin(id) async {
    final SharedPreferences prefs = await _prefs;
    final String? adminString = prefs.getString('admin_key');
    if (adminString != null) {
      admins = Admin.decode(adminString);
    }
    admins.removeWhere((element) => element.id == id);
    final String adminObj = Admin.encode(admins);
    await prefs.setString('admin_key', adminObj);
  }

  editadmin(Admin adminObj) async {
    final SharedPreferences prefs = await _prefs;
    final String? adminString = prefs.getString('admin_key');
    if (adminString != null) {
      admins = Admin.decode(adminString);
    }
    for (int i = 0; i < admins.length; i++) {
      if (admins[i].id == adminObj.id) {
        admins[i].firstName = adminObj.firstName;
        admins[i].lastName = adminObj.lastName;
        admins[i].email = adminObj.email;
        admins[i].phone = adminObj.phone;
        admins[i].address = adminObj.address;
        admins[i].password = adminObj.password;
      }
    }
    final String drvObj = Admin.encode(admins);
    await prefs.setString('admin_key', drvObj);
  }
}





// }
