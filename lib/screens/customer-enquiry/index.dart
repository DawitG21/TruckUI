
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/customer-enquiry/customer_enquiry.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class EnquiryIndex extends StatefulWidget {
  const EnquiryIndex({ Key? key }) : super(key: key);

  @override
  _EnquiryIndexState createState() => _EnquiryIndexState();
}

class _EnquiryIndexState extends State<EnquiryIndex> {
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
              flex: 5,
              child: CustomerEnquiry(),
            ),
          ],
        ),
      ),
    );
  }
}
