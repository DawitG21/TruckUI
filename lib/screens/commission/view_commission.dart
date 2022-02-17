import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/commission.dart';
import 'package:truck_booking_admin/models/quotation.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/commission_detail_view.dart';

class CommissionList extends StatefulWidget {
  const CommissionList({Key? key}) : super(key: key);

  @override
  _CommissionListState createState() => _CommissionListState();
}

class _CommissionListState extends State<CommissionList> {
  List<Commission> commissionList = [];
  final List<Commission> commissionData = ([
    Commission(
        id: 'ac3c1087-ecec-413f-9fdc-1f7b8ceop',
        driverEarning: 100000,
        companyEarning: 10000,
        totalEarning: 50000,
        taxAmount: 5000,
        finalFare: 55000,
        driverToCompany: 3000,
        companyToDriver: 0,
        wallet: 0,
        cash: 55000,
        totalBookings: 2,
        quotations: [
          Quotation(
              quotationId: 'Book-000-009',
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
              driverEmail: 'dawitg@gmail.com',
              driverPhone: '09558585584'),
          Quotation(
              quotationId: 'Book-000-003',
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
              driverEmail: 'usmanu@gmail.com',
              driverPhone: '059884844'),
        ]),
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
                        const Text("Commission"),
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
                                    'Driver Name',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // DataColumn(
                                //   label: Text(
                                //     'Driver Phone',
                                //     overflow: TextOverflow.ellipsis,
                                //   ),
                                // ),
                                DataColumn(
                                  label: Text(
                                    'Driver Earning',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Company Earning',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Tax Amount',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Final Fare',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Driver to Company',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // DataColumn(
                                //   label: Text(
                                //     'Company to Driver',
                                //     overflow: TextOverflow.ellipsis,
                                //   ),
                                // ),
                                DataColumn(
                                  label: Text(
                                    'Number of Rides',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(label: Text('')),
                              ],
                              rows: commissionData
                                  .map<DataRow>(
                                    (element) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          element.quotations![0].driverName
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        // DataCell(Text(
                                        //   element.quotations![0].driverPhone
                                        //       .toString(),
                                        //   overflow: TextOverflow.ellipsis,
                                        // )),
                                        DataCell(Text(
                                          element.driverEarning.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.companyEarning.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        // DataCell(Text(
                                        //   element.totalEarning.toString(),
                                        //   overflow: TextOverflow.ellipsis,
                                        // )),
                                        DataCell(Text(
                                          element.taxAmount.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.finalFare.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.driverToCompany.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        // DataCell(Text(
                                        //   element.companyToDriver.toString(),
                                        //   overflow: TextOverflow.ellipsis,
                                        // )),
                                        DataCell(Text(
                                          element.totalBookings.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Row(
                                          children: [
                                            CommissionDetailPreview(
                                                element.driverEarning!,
                                                element.companyEarning!,
                                                element.totalEarning!,
                                                element.taxAmount!,
                                                element.finalFare!,
                                                element.driverToCompany!,
                                                element.companyToDriver!,
                                                element.wallet!,
                                                element.cash!,
                                                element.totalBookings!,
                                                element.quotations!)
                                          ],
                                        )),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
