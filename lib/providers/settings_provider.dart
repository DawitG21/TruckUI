import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/general_settings.dart';

class SettingsProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<GeneralSettings> settings = [];

  editCoupon(GeneralSettings setting) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('settings_key');
    if (catString != null) {
      settings = GeneralSettings.decode(catString);
    }
    for (int i = 0; i < settings.length; i++) {
      if (settings[i].id == setting.id) {
        settings[i].settingName = setting.settingName;
        settings[i].value = setting.value;
        settings[i].description = setting.description;
      }
    }
    final String settingsObj = GeneralSettings.encode(settings);
    await prefs.setString('settings_key', settingsObj);
  }
}
