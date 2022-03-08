// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/screens/City/index.dart';
import 'package:truck_booking_admin/screens/admins/view_admins.dart';
import 'package:truck_booking_admin/screens/booking/booking_request.dart';
import 'package:truck_booking_admin/screens/booking/customer_booking.dart';
import 'package:truck_booking_admin/screens/booking/driver_booking.dart';
import 'package:truck_booking_admin/screens/cancel-rides/customer_cancellation.dart';
import 'package:truck_booking_admin/screens/cancel-rides/driver_cancellation.dart';
import 'package:truck_booking_admin/screens/cancel_reasons/index.dart';
import 'package:truck_booking_admin/screens/categories/index.dart';
import 'package:truck_booking_admin/screens/coupons/coupons_list.dart';
import 'package:truck_booking_admin/screens/commission/view_commission.dart';
import 'package:truck_booking_admin/screens/customer-enquiry/driver_enquiry.dart';
import 'package:truck_booking_admin/screens/customer-enquiry/index.dart';
import 'package:truck_booking_admin/screens/customers/index.dart';
import 'package:truck_booking_admin/screens/dashboard/index.dart';
import 'package:truck_booking_admin/screens/drivers/index.dart';
import 'package:truck_booking_admin/screens/general-settings/general_settings.dart';

import 'package:truck_booking_admin/screens/important_pages/list_of_pages.dart';
import 'package:truck_booking_admin/screens/notification/index.dart';

import 'package:truck_booking_admin/screens/revenue-management/index-driver-revenue.dart';
import 'package:truck_booking_admin/screens/revenue-management/index.dart';
import 'package:truck_booking_admin/screens/truck_location/customer_view.dart';
import 'package:truck_booking_admin/screens/truck_location/driver_view.dart';
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
                    title: "City ",
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

                  //
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
                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    // collapsedBackgroundColor: Colors.white,
                    // initiallyExpanded: true,
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.description,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Booking',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const CustomerBookingList(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.people_alt,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Customer Booking',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const DriverBookingList(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.drive_eta,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Driver Booking',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const BookingRequestList(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.today,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Booking Requests',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.point_of_sale,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Revenue Management',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const IndexCustomerRevenue(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.people_alt,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Customer Revenue',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const IndexDriverRevenue(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.drive_eta,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Driver Revenue',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // DrawerListTile(
                  //   title: "Revenue Management",
                  //   icon:
                  //       Icon(Icons.point_of_sale, color: AppTheme.sideBarText),
                  //   press: null,
                  // ),
                  // DrawerListTile(
                  //   title: "Cancel Rides",
                  //   icon: Icon(Icons.rule_folder, color: AppTheme.sideBarText),
                  //   press: null,
                  // ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.rule_folder,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Cancel Rides',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const CustomerCancellationList(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.people_alt,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Customer Cancellation',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const DriverCancellationList(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.drive_eta,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Driver Cancellation',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Truck Location

                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.room,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Truck Location',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => CustomerView(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.map,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Customer Map View',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const DriverView(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.map_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Driver Map View',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // DrawerListTile(
                  //   title: "Truck Location",
                  //   icon: Icon(Icons.room, color: AppTheme.sideBarText),
                  //   press: null,
                  // ),

                  //Truck Location

                  DrawerListTile(
                    title: "Coupons",
                    icon:
                        Icon(Icons.card_giftcard, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const CouponList(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  // DrawerListTile(
                  //   title: "Commissions",
                  //   icon: Icon(Icons.calculate, color: AppTheme.sideBarText),
                  //   press: null,
                  // ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.calculate,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Commission',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => CommissionList(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'View Commission',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  DrawerListTile(
                    title: "Cancel Reason ",
                    icon: Icon(Icons.apartment, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CancelReasonsIndex(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.admin_panel_settings,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Admin',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ViewAdminsList(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.engineering,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'View Admins',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //pages

                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.article_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Pages',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ListofPages(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.web,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'View Pages',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // DrawerListTile(
                  //   title: "Truck Location",
                  //   icon: Icon(Icons.room, color: AppTheme.sideBarText),
                  //   press: null,
                  // ),

                  //pages
                  DrawerListTile(
                    title: "Notifications",
                    icon:
                        Icon(Icons.notifications, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => NotificationIndex(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    title: "General Settings",
                    icon: Icon(Icons.settings, color: AppTheme.sideBarText),
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => GeneralSettingsIndex(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                  ),

                  ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(horizontal: 18),
                    iconColor: Colors.white,
                    title: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(
                            Icons.question_answer,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Enquiry',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => EnquiryIndex(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.question_answer_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Customer Enquiry',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const DriverEnquiry(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 9.0),
                                child: Icon(
                                  Icons.question_answer_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Driver Enquiry',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
