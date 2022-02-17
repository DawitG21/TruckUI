// ignore_for_file: use_key_in_widget_ructors, prefer__literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/providers/notifications_provider.dart';
import 'package:truck_booking_admin/screens/notifications/send_notification.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class NotificationsIndex extends StatefulWidget {
  @override
  _NotificationsIndexState createState() => _NotificationsIndexState();
}

class _NotificationsIndexState extends State<NotificationsIndex> {
  List<NotificationsIndex> reasons = [];

  _sendNotification() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => SendNotification(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppTheme.contentBackgroundColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Sidebar(),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  color: AppTheme.contentTextHeader,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notifications",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          _sendNotification();
                        },
                        child: Text('Send Notifications'),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text(
                                'For'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Subject'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Message'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Date'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                          rows: notifications
                              .map<DataRow>(
                                (element) => DataRow(
                                  cells: [
                                    element.type == true
                                        ? DataCell(
                                            Text(
                                              'Customer',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        : DataCell(
                                            Text(
                                              'Driver',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                    DataCell(Text(
                                      element.subject.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    DataCell(Expanded(
                                      child: Text(
                                        element.message.toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                    DataCell(Text(
                                      element.createdAt.toString(),
                                      overflow: TextOverflow.ellipsis,
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Showing 2 out of 2 Results"),
                      Text(
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
    );
  }
}
