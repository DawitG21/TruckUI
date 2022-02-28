import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/City/city_list.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class IndexCity extends StatefulWidget {
  const IndexCity({Key? key}) : super(key: key);

  @override
  _IndexCitysState createState() => _IndexCitysState();
}

class _IndexCitysState extends State<IndexCity> {
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
              child: CityList(),
            ),
          ],
        ),
      ),
    );
  }
}
