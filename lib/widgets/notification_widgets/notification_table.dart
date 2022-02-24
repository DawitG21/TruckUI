// Flutter imports:
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// Package imports:
import 'package:truck_booking_admin/models/notification.dart';
import 'package:truck_booking_admin/providers/notifications_provider.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';

class NotificationTable extends StatefulWidget {
  @override
  _NotificationTableState createState() => _NotificationTableState();
}

class _NotificationTableState extends State<NotificationTable> {
  bool tappedYes = false;
  bool isInit = true;
  bool _isLoading = false;
  List<Notifications> reasons = [];
  TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        _isLoading = false;
      });
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              // _searchNotifications,
              Container(
                height: MediaQuery.of(context).size.height / 1.45,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    DataCell(Text(
                                      element.message.toString(),
                                      overflow: TextOverflow.ellipsis,
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
          );
  }
}
