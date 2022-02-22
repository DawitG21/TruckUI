import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/coupon.dart';
import 'package:truck_booking_admin/providers/coupon_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/coupons/coupons_list.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class CouponEdit extends StatefulWidget {
  const CouponEdit({Key? key}) : super(key: key);

  @override
  _CouponEditState createState() => _CouponEditState();
}

class _CouponEditState extends State<CouponEdit> {
  TextEditingController code = TextEditingController();
  TextEditingController percentage = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  String _id = '';

  @override
  void didChangeDependencies() {
    final Coupon coupon = ModalRoute.of(context)!.settings.arguments as Coupon;
    code.text = coupon.code.toString();
    percentage.text = coupon.percentage.toString();
    startDate.text =
        DateFormat('yyyy-MM-dd').format(coupon.startDate!).toString();
    endDate.text = DateFormat('yyyy-MM-dd').format(coupon.endDate!).toString();
    _id = coupon.id.toString();

    super.didChangeDependencies();
  }

  save() async {
    Coupon coupon = Coupon(
      id: _id,
      code: code.text,
      percentage: int.parse(percentage.text),
      startDate: DateTime.parse(startDate.text),
      endDate: DateTime.parse(endDate.text),
    );
    await Provider.of<CouponProvider>(context, listen: false).editCoupon(coupon);
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Sidebar(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.contentBackgroundColor,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(15),
                      color: AppTheme.contentTextHeader,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: const Icon(Icons.arrow_back_ios),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const CouponList(),
                                      transitionDuration:
                                          const Duration(seconds: 0),
                                    ),
                                  );
                                },
                              ),
                              const Text("Coupons"),
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              save();
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    _buildForm,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildForm {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: code,
              decoration: InputDecoration(
                labelText: 'Coupon Code',
                hintText: 'code',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextFormField(
                controller: percentage,
                decoration: InputDecoration(
                  labelText: 'Percentage',
                  hintText: 'Percentage',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextFormField(
                controller: startDate,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  hintText: 'Select Start Date',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    setState(() {
                      startDate.text =
                          formattedDate; //set output date to TextField value.
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextFormField(
                controller: endDate,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'End Date',
                  hintText: 'Select End Date',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onTap: () async {
                  DateTime? pickedDate2 = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                  );
                  if (pickedDate2 != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate2);

                    setState(() {
                      endDate.text = formattedDate;
                      //set output date to TextField value.
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
