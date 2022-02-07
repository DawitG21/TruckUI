// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/revenue-management/driver-revenue.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class IndexDriverRevenue extends StatefulWidget {
  const IndexDriverRevenue({Key? key}) : super(key: key);

  @override
  _IndexDriverRevenueState createState() => _IndexDriverRevenueState();
}

class _IndexDriverRevenueState extends State<IndexDriverRevenue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppTheme.contentBackgroundColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: Sidebar(),
            ),
            Expanded(
              flex: 4,
              child: DriverRevenue(),
            ),
          ],
        ),
      ),
    );
  }
}
