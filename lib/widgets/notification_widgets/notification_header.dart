// Flutter imports:
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// Package imports:
import 'package:truck_booking_admin/screens/notification/send_notification.dart';

// Project imports:

class NotificationHeader extends StatefulWidget {
  @override
  _NotificationHeaderState createState() => _NotificationHeaderState();
}

class _NotificationHeaderState extends State<NotificationHeader> {
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
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            "Notifications".toUpperCase(),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: navigationIcon(
                icon: Icons.add,
                title: Text(
                  'Send Notification',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              onTap: _sendNotification,
            ),
          )
        ],
      ),
    );
  }

  Widget navigationIcon({icon, title}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
          ),
        ),
        Container(
          child: title,
        )
      ],
    );
  }
}
