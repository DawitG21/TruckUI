import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/cancel_reasons_provider.dart';
import 'package:truck_booking_admin/providers/category_provider.dart';
import 'package:truck_booking_admin/providers/city_provider.dart';
import 'package:truck_booking_admin/providers/customer_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/providers/toast_provider.dart';
import 'package:truck_booking_admin/screens/categories/index.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MenuController()),
      ChangeNotifierProvider.value(value: CategoryProvider()),
      ChangeNotifierProvider.value(value: CustomerProvider()),
      ChangeNotifierProvider.value(value: CityProvider()),
      ChangeNotifierProvider.value(value: CancelProvider()),
      ChangeNotifierProvider.value(value: ToastProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(ctx).textTheme),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.resolveWith((state) => Colors.red),
          ),
        ),
        // iconTheme: IconThemeData(
        //   color: Colors.red,
        // ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const IndexCategory(),
      },
    );
  }
}
