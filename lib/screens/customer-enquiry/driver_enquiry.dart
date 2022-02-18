
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/enquiry.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/DriverEnquiryPreview.dart';

class DriverEnquiry extends StatefulWidget {
  const DriverEnquiry({ Key? key }) : super(key: key);

  @override
  _DriverEnquiryState createState() => _DriverEnquiryState();
}

class _DriverEnquiryState extends State<DriverEnquiry> {

  final List<Enquiry> enquiries = [
    Enquiry(
        id: "1",
        name: "Driver One",
        email: "driverone@gmail.com",
        subject: "Driver Subject",
        cdenquiry: "Driver Enquiry",
        type: "type",
        date: DateTime.now().toString()
    )
  ];

 @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
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
              flex: 5,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: AppTheme.contentTextHeader,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                         Text("Driver Enquiry"),
                        // TextButton(
                        //   style: ButtonStyle(
                        //     foregroundColor:
                        //         MaterialStateProperty.all<Color>(Colors.blue),
                        //   ),
                        //   onPressed: () {
                        //     //_createBookingRequest();
                        //   },
                        //   child: const Text(''),
                        // ),
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
                              'SL No.',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Name',
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
                              'Subject',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Enquiry',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Type',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataColumn(
                              label: Text(
                            'Created On',
                            overflow: TextOverflow.ellipsis,
                          )),
                          DataColumn(
                              label: Text(
                            'Action',
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],



                        rows: enquiries
                            .map<DataRow>(
                              (element) => DataRow(
                                cells: [
                                  DataCell(Text(
                                    element.id.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                   DataCell(Text(
                                    element.name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  DataCell(Text(
                                    element.email.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  DataCell(Text(
                                    element.subject.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  DataCell(Text(
                                    element.cdenquiry.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  DataCell(Text(
                                    element.type.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  const DataCell(Text('2/17/2022'
                                    ,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  

                                  DataCell(Row(
                                    children: [
                                       // ignore: prefer_const_constructors
                                       DriverEnquiryPreview(
                                         name: 'Driver One',
                                         email: 'Driverone@gmail.com',
                                         subject: 'My Subject',
                                         cdenquiry: 'My Subject',
                                         type: 'My Type',
                                         date: DateTime.now().toString(),
                                        
                                      )],
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
                  const Text("Showing 1 out of 1 Results"),
                  const Text(
                    "Next Page",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
              )
              
           ] , ),
                     
     )
     );
  }
}

