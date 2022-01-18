import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/driver.dart';

class DriverProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Driver> drivers = [];

  addDriver(Driver driver) async {
    final SharedPreferences prefs = await _prefs;
    final String? driveString = prefs.getString('driver_key');
    if (driveString != null) {
      drivers = Driver.decode(driveString);
    }
    drivers.add(driver);
    final String drvObj = Driver.encode(drivers);
    await prefs.setString('driver_key', drvObj);
  }

  deleteDriver(id) async {
    final SharedPreferences prefs = await _prefs;
    final String? driveString = prefs.getString('driver_key');
    if (driveString != null) {
      drivers = Driver.decode(driveString);
    }
    drivers.removeWhere((element) => element.id == id);
    final String drvObj = Driver.encode(drivers);
    await prefs.setString('driver_key', drvObj);
  }

  editDriver(Driver driverObj) async {
    final SharedPreferences prefs = await _prefs;
    final String? driveString = prefs.getString('driver_key');
    if (driveString != null) {
      drivers = Driver.decode(driveString);
    }
    for (int i = 0; i < drivers.length; i++) {
      if (drivers[i].id == driverObj.id) {
        drivers[i].name = driverObj.name;
        drivers[i].email = driverObj.email;
        drivers[i].phone = driverObj.phone;
        drivers[i].city = driverObj.city;
        drivers[i].plateNumber = driverObj.plateNumber;
        drivers[i].truckCategory = driverObj.truckCategory;
        drivers[i].isActive = driverObj.isActive;
      }
    }
    final String drvObj = Driver.encode(drivers);
    await prefs.setString('driver_key', drvObj);
  }
}
