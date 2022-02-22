import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/coupon.dart';

class CouponProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Coupon> coupons = [];

  addCoupon(Coupon coupon) async {
    final SharedPreferences prefs = await _prefs;
    final String? couponString = prefs.getString('coupon_key');
    if (couponString != null) {
      coupons = Coupon.decode(couponString);
    }
    coupons.add(coupon);
    final String catObj = Coupon.encode(coupons);
    await prefs.setString('coupon_key', catObj);
  }

  deleteCoupon(id) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('coupon_key');
    if (catString != null) {
      coupons = Coupon.decode(catString);
    }
    coupons.removeWhere((element) => element.id == id);
    final String coupObj = Coupon.encode(coupons);
    await prefs.setString('coupon_key', coupObj);
  }

  editCoupon(Coupon couponObj) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('coupon_key');
    if (catString != null) {
      coupons = Coupon.decode(catString);
    }
    for (int i = 0; i < coupons.length; i++) {
      if (coupons[i].id == couponObj.id) {
        coupons[i].code = couponObj.code;
        coupons[i].percentage = couponObj.percentage;
        coupons[i].startDate = couponObj.startDate;
        coupons[i].endDate = couponObj.endDate;
      }
    }
    final String cusObj = Coupon.encode(coupons);
    await prefs.setString('coupon_key', cusObj);
  }
}
