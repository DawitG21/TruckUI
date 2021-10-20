// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/models/category.dart';

class CategoryView extends StatelessWidget {
  final Category element;

  const CategoryView({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/tuck.jpg'),
              backgroundColor: Colors.transparent,
              radius: 70,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Center(
                  // ignore: prefer_adjacent_string_concatenation
                  child: Text('Car/Taxi Name' +
                      '                  ' +
                      element.name.toString()),
                ),
                //Text('Medium trucks')
              ],
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_adjacent_string_concatenation
                Text('Weight Details' + '                  ' + element.weight),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 100,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text('Description'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text(element.description.toString()),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
