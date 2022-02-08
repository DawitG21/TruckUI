import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/cancel_ride.dart';
import 'package:truck_booking_admin/models/quotation.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/driver_rides_preview.dart';

class DriverCancellationList extends StatefulWidget {
  const DriverCancellationList({Key? key}) : super(key: key);

  @override
  _DriverCancellationListState createState() => _DriverCancellationListState();
}

class _DriverCancellationListState extends State<DriverCancellationList> {
  List<CancelRides> driverCancelRidesNew = [];
  final List<CancelRides> driverCancelRides = ([
    CancelRides(
      id: 'ac3c1087-ecec-413f-9fdc-1f7b8ceop',
      cancelReason: 'Customer not responding',
      cancelType: 'Free',
      totalBookings: 3,
      quotations: [
        Quotation(
            quotationId: 'Book-000-003',
            customerName: 'Jane Doe',
            customerEmail: 'jane@gmail.com',
            customerPhone: '+251-989-1256',
            pickupDate: DateTime.now(),
            pickupLocation: 'Bole, Airport Road',
            dropLocation: 'Bole, Sunshine Realestate',
            truckCategory: 'Heavy Truck',
            truckSubCategory: '8 Ton',
            recieverName: 'Dawit G',
            revieverPhone: '+251-976-445-590',
            quoteDate: DateTime.now(),
            status: 'Quote Active',
            driverName: 'Chala Kebede',
            driverPhone: '+251-912-999-654',
            driverEmail: 'chala@gmail.com'),
        Quotation(
            quotationId: 'Book-000-005',
            customerName: 'Dani Doe',
            customerEmail: 'dani@gmail.com',
            customerPhone: '+251-989-12786',
            pickupDate: DateTime.now(),
            pickupLocation: 'Bulbula, Airport Road',
            dropLocation: 'Lafto, Sunshine Realestate',
            truckCategory: 'Heavy Truck',
            truckSubCategory: '9 Ton',
            recieverName: 'Chaltu G',
            revieverPhone: '+251-976-445-590',
            quoteDate: DateTime.now(),
            status: 'Quote Active',
            driverName: 'Tolosa Kebede',
            driverPhone: '+251-912-999-654',
            driverEmail: 'tolosa@gmail.com'),
        Quotation(
            quotationId: 'Book-000-009',
            customerName: 'Jane Doe',
            customerEmail: 'jane@gmail.com',
            customerPhone: '+251-989-1256',
            pickupDate: DateTime.now(),
            pickupLocation: 'Gerji, Bole Sub City',
            dropLocation: 'Ayat, Helen bldg.',
            truckCategory: 'Medium Truck',
            truckSubCategory: '5 Ton',
            recieverName: 'Muluken T',
            revieverPhone: '+251-912-459-098',
            quoteDate: DateTime.now(),
            status: 'Quote Active',
            driverName: 'Miskin Chala',
            driverPhone: '+251-541-651-222',
            driverEmail: 'mule@gmail.com')
      ],
    )
  ]);

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
                        const Text("Driver Cancellation Rides"),
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
                                    'Driver Name',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Email',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Phone',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Booking Number',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                    label: Text(
                                  '',
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                              rows: driverCancelRides
                                  .map<DataRow>(
                                    (element) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          element.quotations![0].driverName
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.quotations![0].driverEmail
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.quotations![0].driverPhone
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.totalBookings.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(
                                          Row(
                                            children: [
                                              DriverRidesPreview(
                                                element.cancelReason!,
                                                element.cancelType!,
                                                element.totalBookings!,
                                                element.quotations!,
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
