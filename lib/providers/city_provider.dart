import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/city.dart';

class CityProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  List<City> cities = [];

  addCity(City city) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('city_key');
    if (catString != null) {
      cities = City.decode(catString);
    }
    cities.add(city);
    final String ciObj = City.encode(cities);
    await prefs.setString('city_key', ciObj);
  }

  editCity(City cityObj) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('city_key');
    if (catString != null) {
      cities = City.decode(catString);
    }
    for (int i = 0; i < cities.length; i++) {
      if (cities[i].id == cityObj.id) {
        cities[i].name = cityObj.name;
        cities[i].radius = cityObj.radius;
         cities[i].latitude = cityObj.latitude;
           cities[i].longtude = cityObj.longtude;
        
      }
    }
    final String ciObj = City.encode(cities);
    await prefs.setString('city_key', ciObj);
  }

  deleteCity(id) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('city_key');
    if (catString != null) {
      cities = City.decode(catString);
    }
    cities.removeWhere((element) => element.id == id);
    final String ciObj = City.encode(cities);
    await prefs.setString('city_key', ciObj);
  }
}
