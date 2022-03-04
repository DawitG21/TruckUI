import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class CityDetailPreview extends StatelessWidget {
  final String name;
  final double radius;
  final double latitude;
  final double longtiude;
  final String date;

  // ignore: use_key_in_widget_constructors
  const CityDetailPreview( 
      
        this.name,
       this.radius,
       this.latitude,
       this.longtiude,
       this.date);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'View',
      onPressed: () async {
        showModalSideSheet(
          context: context,
          width: 500,
          ignoreAppBar: false,
          body: SingleChildScrollView(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: <Widget>[
                const Text('City Detail View'),
                const Divider(
                  height: 1.0,
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Name'),
                  subtitle: Text(name),
                ),
                ListTile(
                  leading: const Icon(Icons.map),
                  title: const Text('Radius'),
                  subtitle: Text(radius.toString()),
                ),
                ListTile(
                  leading: const Icon(Icons.map_outlined),
                  title: const Text('Latitude'),
                  subtitle: Text(latitude.toString()),
                ),
                ListTile(
                  leading: const Icon(Icons.map_rounded),
                  title: const Text('Longitude'),
                  subtitle: Text(longtiude.toString()),
                ),
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: const Text('Date'),
                  subtitle: Text(DateTime.now().toString()
                    ,
                  ),
                ),
              ],
            ),
          )

              //  const Divider(),

              ),
        );
      },
      icon: const Icon(
        Icons.visibility,
      ),
    );
  }
}
