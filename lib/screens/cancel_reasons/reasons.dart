// Flutter imports:
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/cancel_reason_widgets/cancel_header.dart';
import 'package:truck_booking_admin/widgets/cancel_reason_widgets/cancel_table.dart';

class CancelReason extends StatefulWidget {
  const CancelReason({Key? key}) : super(key: key);

  @override
  _CancelReasonState createState() => _CancelReasonState();
}

class _CancelReasonState extends State<CancelReason> {
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
          CancelReasonHeader(),
          Divider(),
          CancelReasonTable(),
        ],
      ),
    );
  }
}
