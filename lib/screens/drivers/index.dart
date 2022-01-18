import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/drivers/drivers_list.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';

class IndexDrivers extends StatefulWidget {
  const IndexDrivers({Key? key}) : super(key: key);

  @override
  _IndexDriversState createState() => _IndexDriversState();
}

class _IndexDriversState extends State<IndexDrivers> {
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
              child: DriverList(),
            ),
          ],
        ),
      ),
    );
  }
}
