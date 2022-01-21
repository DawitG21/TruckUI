// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/screens/City/index.dart';
import 'package:truck_booking_admin/screens/categories/index.dart';
import 'package:truck_booking_admin/screens/customers/index.dart';
import 'package:truck_booking_admin/screens/dashboard/index.dart';
import 'package:truck_booking_admin/screens/drivers/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/drawerlist.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _controllerOne,
        child: ListView(
          controller: _controllerOne,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              color: AppTheme.sideBarColor,
              child: Column(
                children: [
                  DrawerListTile(
                    title: "Dashboard",
                    icon: Icon(Icons.home_max, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const IndexDashboard(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    title: "City",
                    icon: Icon(Icons.apartment, color: AppTheme.sideBarText),
                   press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const IndexCity(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    title: "Truck Categories",
                    icon:
                        Icon(Icons.local_shipping, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const IndexCategory(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    title: "Customers",
                    icon: Icon(Icons.people_alt, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const IndexCustomers(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    title: "Drivers",
                    icon: Icon(Icons.drive_eta, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const IndexDrivers(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    title: "Booking",
                    icon: Icon(Icons.menu_book, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Revenue Management",
                    icon:
                        Icon(Icons.point_of_sale, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Cancel Rides",
                    icon: Icon(Icons.rule_folder, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Truck Location",
                    icon: Icon(Icons.room, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Coupons",
                    icon:
                        Icon(Icons.card_giftcard, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Commissions",
                    icon: Icon(Icons.calculate, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Cancel Reasons",
                    icon: Icon(Icons.close, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Admins",
                    icon: Icon(Icons.admin_panel_settings,
                        color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Pages",
                    icon: Icon(Icons.book, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Notifications",
                    icon:
                        Icon(Icons.notifications, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "General Settings",
                    icon: Icon(Icons.settings, color: AppTheme.sideBarText),
                    press: null,
                  ),
                  DrawerListTile(
                    title: "Enquiry",
                    icon: Icon(Icons.admin_panel_settings,
                        color: AppTheme.sideBarText),
                    press: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
