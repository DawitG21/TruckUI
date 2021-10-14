// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';

class DrawerListTile extends StatelessWidget {
  final title, icon;
  final press;

  const DrawerListTile({Key? key, this.title, this.icon, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: AppTheme.sideBarText),
      ),
    );
  }
}
