// Flutter imports:
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/screens/cancel_reasons/create_reason.dart';

class CancelReasonHeader extends StatefulWidget {
  @override
  _CancelReasonHeaderState createState() => _CancelReasonHeaderState();
}

class _CancelReasonHeaderState extends State<CancelReasonHeader> {
  _createReason() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => CreateReason(),
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
            "Cancel Reasons".toUpperCase(),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: navigationIcon(
                icon: Icons.add,
                title: Text(
                  'Create Reason',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              onTap: _createReason,
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
