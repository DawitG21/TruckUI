import 'package:flutter/material.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class DriverEnquiryPreview extends StatelessWidget {
  final String name;
  final String email;
  final String subject;
  final String cdenquiry;
  final String type;
  final String date;

  const DriverEnquiryPreview(
      {required this.name,
      required this.email,
      required this.subject,
      required this.cdenquiry,
      required this.type,
      required this.date});

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
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // Center(
                  //   child: CircleAvatar(
                  //     backgroundImage: AssetImage(imageUrl),
                  //     backgroundColor: Colors.transparent,
                  //     radius: 70,
                  //   ),
                  // ),
const Text('Driver Detail View'),

                  const Divider(),

                  Column(
                    children: <Widget>[
                      //  ListTile(
                      //   leading:  Icon(Icons.person),
                      //   title:  TextField(
                      //     decoration:  InputDecoration(
                      //       hintText: "Name",
                      //     ),
                      //   ),
                      // ),
                      //  ListTile(
                      //   leading: Icon(Icons.phone),
                      //   title:  TextField(
                      //     decoration:  InputDecoration(
                      //       hintText: "Phone",
                      //     ),
                      //   ),
                      // ),
                      //  ListTile(
                      //   leading: Icon(Icons.email),
                      //   title:  TextField(
                      //     decoration:  InputDecoration(
                      //       hintText: "Email",
                      //     ),
                      //   ),
                      // ),
                      // Divider(
                      //   height: 1.0,
                      // ),

                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Name'),
                        subtitle: Text(name),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('Email'),
                        subtitle: Text(email),
                      ),
                      ListTile(
                        leading: const Icon(Icons.subject),
                        title: const Text('Subject'),
                        subtitle: Text(subject),
                      ),

                      ListTile(
                        leading: const Icon(Icons.question_answer),
                        title: const Text('Enquiry'),
                        subtitle: Text(cdenquiry),
                      ),

                      ListTile(
                        leading: const Icon(Icons.chat_bubble_outline),
                        title: const Text('Type'),
                        subtitle: Text(type),
                      ),
                      ListTile(
                        leading: const Icon(Icons.date_range),
                        title: const Text('Created On'),
                        subtitle: Text(date),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.visibility,
      ),
    );
  }
}
