import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/cancel_reasons.dart';
import 'package:truck_booking_admin/models/general_type.dart';

class CancelProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<CancelReasons> reasons = [];

  addReason(CancelReasons reason) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('reason_key');
    if (catString != null) {
      // reasons = CancelReasons.decode(catString);
      reasons = catString as List<CancelReasons>;
    }
    reasons.add(reason);
    // final String catObj = CancelReasons.encode(reasons);
    final String catObj = reasons as String;
    await prefs.setString('reason_key', catObj);
  }

  editReason(CancelReasons reasonObj) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('reason_key');
    if (catString != null) {
      // reasons = CancelReasons.decode(catString);
      reasons = catString as List<CancelReasons>;
    }
    for (int i = 0; i < reasons.length; i++) {
      if (reasons[i].id == reasonObj.id) {
        reasons[i].reasonType = reasonObj.reasonType;
        reasons[i].reasonFor = reasonObj.reasonFor;
      }
    }
    // final String resObj = CancelReasons.encode(reasons);
    final String resObj = reasons as String;
    await prefs.setString('reason_key', resObj);
  }

  deactivateReason(id) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('reason_key');
    if (catString != null) {
      // reasons = CancelReasons.decode(catString);
      reasons = catString as List<CancelReasons>;
    }
    reasons.removeWhere((element) => element.id == id);
    // final String cusObj = CancelReasons.encode(reasons);
    final String cusObj = reasons as String;
    await prefs.setString('reason_key', cusObj);
  }
}

final List<CancelReasons> cancelReasons = [
  CancelReasons(
    id: 'ac3c1087-ecec-413f-9fdc-1f7b8ceop',
    reasonType: 'City Booking',
    reasonFor: 'Driver',
    reason: 'Customer is not reachable',
    cancelPrice: 0,
    cancelDuration: 0,
    cancelType: true,
  ),
  CancelReasons(
    id: 'ac2c1084-ecec-413f-9fdc-1f7b8ceop',
    reasonType: 'City Booking',
    reasonFor: 'Customer',
    reason: 'Driver is late',
    cancelPrice: 20,
    cancelDuration: 2,
    cancelType: false,
  )
];

final List<GeneralType> cancelType = [
  GeneralType(id: '0', name: 'City Booking'),
  GeneralType(id: '1', name: 'OutStation Booking'),
  GeneralType(id: '2', name: 'OutStation Pooling'),
];

final List<GeneralType> cancelledFor = [
  GeneralType(id: '0', name: 'Customer'),
  GeneralType(id: '1', name: 'Driver'),
];
