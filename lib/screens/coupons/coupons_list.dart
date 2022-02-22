import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/coupon.dart';
import 'package:truck_booking_admin/providers/coupon_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/coupons/coupon_create.dart';
import 'package:truck_booking_admin/screens/coupons/coupon_edit.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class CouponList extends StatefulWidget {
  const CouponList({Key? key}) : super(key: key);

  @override
  _CouponListState createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<Coupon> coupons = [];
  final String encodedCoupons = Coupon.encode([
    Coupon(
      id: 'ac3c1087-ecec-413f-9fdc',
      code: 'ADDIS10',
      percentage: 10,
      startDate: DateTime.now(),
      endDate: DateTime(2022, 3, 1),
    ),
    Coupon(
      id: 'ac3c1087-7654-413f-9fdc',
      code: 'coup-20',
      percentage: 20,
      startDate: DateTime.now(),
      endDate: DateTime(2022, 2, 30),
    ),
  ]);

  _createCoupon() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CouponCreate(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  _editCoupon(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CouponEdit(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
  }

  _deleteCoupon(id) async {
    await Provider.of<CouponProvider>(context, listen: false).deleteCoupon(id);
    final SharedPreferences prefs = await _prefs;
    final String? cusString = prefs.getString('coupon_key');
    setState(() {
      if (cusString != null) {
        coupons = Coupon.decode(cusString);
      }
    });
    toastMessage('Sucessful');
  }

  toastMessage(msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      timeInSecForIosWeb: 5,
      webShowClose: true,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    // await prefs.setString('coupon_key', encodedCoupons);
    final String? storageKey = prefs.getString('coupon_key');
    setState(() {
      coupons = Coupon.decode(storageKey!);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppTheme.contentBackgroundColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Sidebar(),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: AppTheme.contentTextHeader,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Coupons"),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: _createCoupon,
                          child: const Text('Create Coupon'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 30.0, right: 30.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Coupon Code',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Percentage',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Start Date',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'End Date',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                    label: Text(
                                  '',
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                              rows: coupons
                                  .map<DataRow>(
                                    (element) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          element.code!,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.percentage!.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          DateFormat("yyyy-MM-dd")
                                              .format(element.startDate!)
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          DateFormat("yyyy-MM-dd")
                                              .format(element.endDate!),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                tooltip: 'Edit',
                                                onPressed: () async {
                                                  _editCoupon(element);
                                                },
                                                icon: const Icon(Icons.edit),
                                              ),
                                              IconButton(
                                                tooltip: 'Delete',
                                                onPressed: () async {
                                                  _deleteCoupon(element.id);
                                                },
                                                icon: const Icon(
                                                  Icons.delete_forever,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("Showing 6 out of 6 Results"),
                        const Text(
                          "Next Page",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
