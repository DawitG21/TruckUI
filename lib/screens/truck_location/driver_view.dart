import 'package:flutter/material.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
// import 'package:truck_booking_admin/screens/truck_location/index_map_view.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:provider/provider.dart';

class DriverView extends StatefulWidget {
  const DriverView({Key? key}) : super(key: key);

  @override
  _DriverViewState createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
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
                        const Text("Driver Map View"),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            //_createBookingRequest();
                          },
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
                                    'Sl No.',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Driver Name',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Driver Mobile',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Driver Status',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(label: Text('')),
                              ],
                              rows: const [],
                              // rows: [], cancelRidesEncoded
                              //     .map<DataRow>(
                              //       (element) => DataRow(
                              //         cells: [
                              //           DataCell(Text(
                              //             element.quotations![0].customerName
                              //                 .toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Text(
                              //             element.quotations![0].customerEmail
                              //                 .toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Text(
                              //             element.quotations![0].customerPhone
                              //                 .toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Text(
                              //             element.totalBookings.toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Row(
                              //             children: [
                              //               CustomerRidesPreview(
                              //                 element.cancelReason!,
                              //                 element.cancelType!,
                              //                 element.cancelPenalty!.toDouble(),
                              //                 element.totalBookings!,
                              //                 element.quotations!,
                              //               ),
                              //               // IconButton(onPressed: onPressed, icon: icon)
                              //             ],
                              //           )),
                              //         ],
                              //       ),
                              //     )
                              //     .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text("Showing 0 out of 0 Results"),
                            const Text(
                              "Next Page",
                            ),
                          ],
                        ),
                      ),
                      //added Textfied and Text

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        padding: const EdgeInsets.all(25),
                        width: 400.0,
                        child: Column(
                          children: const [
                            //Text('Search The Location'),

                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Search The Location Here',
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: const [
                              Text(
                                "No of Free Drivers:  ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "O Driver ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "No of Occupied  Drivers: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'O Driver ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
