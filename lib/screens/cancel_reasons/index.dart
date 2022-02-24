// Flutter imports:
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/cancel_reasons/reasons.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class CancelReasonsIndex extends StatefulWidget {
  static const routeName = '/cancelreasons';

  const CancelReasonsIndex({Key? key}) : super(key: key);

  @override
  _CancelReasonsIndexState createState() => _CancelReasonsIndexState();
}

class _CancelReasonsIndexState extends State<CancelReasonsIndex> {
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
              child: CancelReason(),
            ),
          ],
        ),
      ),
    );
  }
}
