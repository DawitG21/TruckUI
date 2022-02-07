// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/models/quotation.dart';
import 'package:truck_booking_admin/models/revenue.dart';
import 'package:truck_booking_admin/models/revenue_new.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/driver_revenue_preview.dart';

class DriverRevenue extends StatefulWidget {
  const DriverRevenue({Key? key}) : super(key: key);

  @override
  _DriverRevenueState createState() => _DriverRevenueState();
}

class _DriverRevenueState extends State<DriverRevenue> {
  List<Revenue> revenues = [];
  List<RevenueNew> revenuesNew = [];

  final List<RevenueNew> encodedData2 = ([
    RevenueNew(
      id: 'ac3c1087-ecec-413f-9fdc-1f7b8ceop',
      totalFare: 3200,
      totalBookings: 2,
      quotations: [
        Quotation(
            quotationId: 'Book-000-001',
            customerName: 'Jane Doe',
            customerEmail: 'jane@gmail.com',
            customerPhone: '+251-989-1256',
            pickupDate: DateTime.now(),
            pickupLocation: 'Bole, Airport Road',
            dropLocation: 'CMC, Sunshine Realestate',
            truckCategory: 'Heavy Truck',
            truckSubCategory: '8 Ton',
            recieverName: 'Dawit G',
            revieverPhone: '+251-976-445-590',
            quoteDate: DateTime.now(),
            status: 'Quote Active',
            driverName: 'Habtamu Kebede',
            driverPhone: '+251-912-999-654'),
        Quotation(
            quotationId: 'Book-000-002',
            customerName: 'Jane Doe',
            customerEmail: 'jane@gmail.com',
            customerPhone: '+251-989-1256',
            pickupDate: DateTime.now(),
            pickupLocation: 'Gerji, Bole Sub City',
            dropLocation: 'Kolfe, Helen bldg.',
            truckCategory: 'Medium Truck',
            truckSubCategory: '5 Ton',
            recieverName: 'Muluken T',
            revieverPhone: '+251-912-459-098',
            quoteDate: DateTime.now(),
            status: 'Quote Active',
            driverName: 'Habtamu Kebede',
            driverPhone: '+251-541-651-222')
      ],
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          color: AppTheme.contentTextHeader,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Driver Revenue"),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 30.0, right: 30.0),
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
                          'No of Bookings',
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
                          'Status',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(label: Text('')),
                    ],
                    rows: encodedData2
                        .map<DataRow>(
                          (element) => DataRow(
                            cells: [
                              DataCell(Text(
                                element.quotations![0].driverName.toString(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                element.quotations![0].customerEmail.toString(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                element.quotations![0].driverPhone.toString(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                element.totalBookings.toString(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                element.totalFare.toString(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                element.quotations![0].status.toString(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(
                                Row(
                                  children: [
                                    DriverRevenuePreview(
                                      element.totalFare!,
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
              const Text("Showing 4 out of 4 Results"),
              const Text(
                "Next Page",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
