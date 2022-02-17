import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/general_type.dart';
import 'package:truck_booking_admin/models/notification.dart';

class NotificationProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Notifications> notifications = [];

  sendNotification(Notifications reason) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('reason_key');
    if (catString != null) {
      // reasons = Notifications.decode(catString);
      notifications = catString as List<Notifications>;
    }
    notifications.add(reason);
    // final String catObj = Notifications.encode(notifications);
    final String catObj = notifications as String;
    await prefs.setString('reason_key', catObj);
  }
}

final List<Notifications> notifications = [
  Notifications(
    id: 'ac3c1087-ecec-413f-9fdc-1f7b8ceop',
    type: true, //'Customer',
    subject: '50% Discount',
    message: 'There will be a 50% offer...',
    createdAt: '2022-02-17 16:07:20',
  ),
  Notifications(
    id: 'ac2c1084-ecec-413f-9fdc-1f7b8ceop',
    type: false, //'Driver',
    subject: 'Google Map Directions',
    message: 'The customers are complaining...',
    createdAt: '2022-02-16 16:07:20',
  )
];

final List<GeneralType> customers = [
  GeneralType(id: '0', name: 'Nahyan Al Nahyan'),
  GeneralType(id: '1', name: 'Dawit Gorfu'),
  GeneralType(id: '2', name: 'Muluken Tekle'),
  GeneralType(id: '3', name: 'Usman Umer'),
];

final List<GeneralType> senders = [
  GeneralType(id: '0', name: 'Customers'),
  GeneralType(id: '1', name: 'Drivers'),
];
