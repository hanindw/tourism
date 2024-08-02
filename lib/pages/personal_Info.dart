import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/model/payment_flight_model.dart';
import 'package:tourism/pages/addPassenger.dart';
import 'package:tourism/pages/payment_flight.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/widget/customscaffold.dart';

class Personal_Info extends StatefulWidget {
  static String id = "personalinfo";

  @override
  State<Personal_Info> createState() => _Personal_InfoState();
}

class _Personal_InfoState extends State<Personal_Info> {
  final _formKey = GlobalKey<FormState>();

  // بيانات الحجز
  String? Contact_Name;
  String? Phone_Number;
  String? _email;
  int _passengersCount = 0;
  List<PassengerData> _passengers = [];

  DateTime? startDate;

  @override
  Widget build(BuildContext context) => CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(right: 220),
              child: Text(
                "Enter Info..",
                style: TextStyle(
                  color: Color(0XFF1B4158),
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            // SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_passengers.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(11),
                              child: Row(
                                children: [
                                  Text(
                                    '${_passengers[0].name} ',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${_passengers[0].lastname} ',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  focusColor: Colors.black,
                                  hoverColor: Color.fromARGB(255, 51, 86, 116),
                                  activeColor: Color.fromARGB(255, 51, 86, 116),
                                  checkColor: Colors.white,
                                  value: _passengers[0].isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _passengers[0].isChecked = value!;
                                    });
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AddPassengersScreen.id);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16.0, right: 70, left: 70),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 51, 86, 116),
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddPassengersScreen(
                                  passengersCount: _passengersCount,
                                  onPassengerAdded: (passengerData) {
                                    setState(() {
                                      _passengers.add(passengerData);
                                      _passengersCount++;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add_circle_outlined,
                                  size: 22, color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add Passenger',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 35),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 255),
                            child: Text(
                              'Contact',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter your name';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  Contact_Name = value;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Color(0XFF1B4158),
                                          width: 0.9999),
                                    ),
                                    hintText: "Contact Name",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.person_2,
                                      color: Color(0XFF1B4158),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter your Phone Number';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  Phone_Number = value;
                                },
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: Color(0XFF1B4158),
                                        width: 0.9999),
                                  ),
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  prefixIcon: Icon(
                                    Icons.numbers_outlined,
                                    color: Color(0XFF1B4158),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter your Email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Color(0XFF1B4158),
                                          width: 0.9999),
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(0XFF1B4158),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 51, 86, 116),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Navigator.pushReplacementNamed(
                                    context, Payment_Flight.id);
                              }
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        )),
      ));
}
