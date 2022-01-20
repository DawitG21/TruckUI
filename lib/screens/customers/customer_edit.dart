import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/customer.dart';
import 'package:truck_booking_admin/providers/customer_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/customers/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class CustomerEdit extends StatefulWidget {
  const CustomerEdit({Key? key}) : super(key: key);

  @override
  _CustomerEditState createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
  String defaultPic = 'assets/images/profile.jpg';
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  String _id = '';
  var _imageFile;
  bool _isActive = true;
  DateTime _date = DateTime.now();

  save() async {
    Customer customer = Customer(
      id: _id,
      name: fullName.text,
      email: email.text,
      phone: phone.text,
      address: address.text,
      isActive: _isActive,
      date: _date,
    );
    await Provider.of<CustomerProvider>(context, listen: false)
        .editCustomer(customer);
    toastMessage('Sucessful');
  }

  toastMessage(msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      timeInSecForIosWeb: 5,
      webShowClose: true,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void didChangeDependencies() {
    final Customer customer =
        ModalRoute.of(context)!.settings.arguments as Customer;
    fullName.text = customer.name.toString();
    email.text = customer.email.toString();
    phone.text = customer.phone.toString();
    address.text = customer.address.toString();
    _id = customer.id.toString();
    _isActive = customer.isActive!;
    _date = customer.date!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Sidebar(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.contentBackgroundColor,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(15),
                      color: AppTheme.contentTextHeader,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: const Icon(Icons.arrow_back_ios),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const IndexCustomers(),
                                      transitionDuration:
                                          const Duration(seconds: 0),
                                    ),
                                  );
                                },
                              ),
                              const Text("Customers"),
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              save();
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    _buildForm,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _buildForm {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fullName,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'e.g Jane Doe',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'email address',
                        hintText: 'e.g janedoe@gmail.com',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'e.g +251 9...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: address,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'e.g full address here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    value: _isActive,
                    title: const Text('Active', style: TextStyle(fontSize: 14)),
                    onChanged: (bool value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: _imageFile != null
                      ? Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(_imageFile),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(15.0),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              defaultPic,
                              height: 150.0,
                              width: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      // chooseImage(ImageSource.gallery);
                    },
                    child: const Text('Upload Picture'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      elevation: 3,
                      // ignore: unnecessary_new
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
