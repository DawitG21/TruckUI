import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/customer_booking_detail.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/customer_booking_detail_view.dart';

class CustomerBookingDetail extends StatefulWidget {
  const CustomerBookingDetail({Key? key}) : super(key: key);

  @override
  _CustomerBookingDetailState createState() => _CustomerBookingDetailState();
}

class _CustomerBookingDetailState extends State<CustomerBookingDetail> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<CustomerBookDetails> customerBookings = [];
  final String encodedData = CustomerBookDetails.encode([
    CustomerBookDetails(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      quotationId: 'QIDsjkhwuyoewiurioewu',
      date: DateTime.now(),
      orderStatus: 'Delivered',
      totalFare: 3595,
      pickup: 'Addis Ababa',
      drop: 'Adama Express',
      category: 'Heavy Truck',
    ),
    CustomerBookDetails(
      id: "ac3c1dfd087-ecec-413f-9fdc-1f7b8ce9d9ops",
      quotationId: 'QIDsjkhw34323uyoewiurioewu',
      date: DateTime.now(),
      orderStatus: 'In Ride',
      totalFare: 357495,
      pickup: 'Addis Ababa',
      drop: 'Adama Express',
      category: 'Medium Truck',
    ),
    CustomerBookDetails(
      id: "ac3cfdf1087-ecec-413f-9fdc-1f7b8asce99ops",
      quotationId: 'QIDsj54454khwuyoewiurioewu',
      date: DateTime.now(),
      orderStatus: 'Delivered',
      totalFare: 43595,
      pickup: 'Addis Ababa',
      drop: 'Adama Express',
      category: 'Easy Truck',
    ),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('customerBookingDetail_key', encodedData);
    final String? storageKey = prefs.getString('customerBookingDetail_key');
    setState(() {
      customerBookings = CustomerBookDetails.decode(storageKey!);
      // print(customerBookings.length);
    });
    super.didChangeDependencies();
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
                        const Text("Chala Studio Junta"),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: null,
                          child: const Text(''),
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
                                    'Quotation ID',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Date',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Order Status',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Total Fare',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                    label: Text(
                                  '',
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                              rows: customerBookings
                                  .map<DataRow>(
                                    (element) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          element.quotationId
                                              .toString()
                                              .toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.date.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.orderStatus.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.totalFare.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(
                                          Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              CustomerBookingPreview(
                                                element.quotationId!,
                                                'Registered on - ' +
                                                    DateFormat("yyyy-MM-dd")
                                                        .format(element.date!),
                                                element.orderStatus!,
                                                element.totalFare!,
                                                element.pickup!,
                                                element.drop!,
                                                element.category!,
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
