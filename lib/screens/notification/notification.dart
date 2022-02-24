// Flutter imports:
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/notification_widgets/notification_header.dart';
import 'package:truck_booking_admin/widgets/notification_widgets/notification_table.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgContainer,
        borderRadius: BorderRadius.circular(30),
      ),
      // original is column
      child: Column(
        children: [
          NotificationHeader(),
          Divider(),
          NotificationTable(),
        ],
      ),
    );
  }
}
