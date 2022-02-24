// Flutter imports:
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/notification/notification.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class NotificationIndex extends StatefulWidget {
  static const routeName = '/notifications';

  const NotificationIndex({Key? key}) : super(key: key);

  @override
  _NotificationIndexState createState() => _NotificationIndexState();
}

class _NotificationIndexState extends State<NotificationIndex> {
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

            /// Main Body Part
            Expanded(
              flex: 4,
              child: Notifications(),
            ),
          ],
        ),
      ),
    );
  }
}
