import 'package:flutter/material.dart';
import 'package:tourism/pages/success.dart';
import 'package:tourism/pages/tripaddPassenger.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class tripBooking extends StatefulWidget {
  static String id = "book";

  @override
  State<tripBooking> createState() => _tripBookingState();
}

class _tripBookingState extends State<tripBooking> {
  final GlobalKey<FormState> keytrip = GlobalKey<FormState>();

  int _passengersCount = 0;

  List<PassengerData> _passengers = [];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 50, bottom: 15, right: 16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Form(
              key: keytrip,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Enter Your Info to Book",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF1B4158)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
                                      context, tripaddPassenger.id);
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
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
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
                              builder: (context) => tripaddPassenger(
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Contact:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0XFF1B4158),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    labelText: "Full Name",
                    prefixIcon: Icons.person,
                    validationMessage: "Please Enter Your Name",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Phone Number",
                    prefixIcon: Icons.phone,
                    validationMessage: "Please Enter Your Number",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Email",
                    prefixIcon: Icons.email,
                    validationMessage: "Please Enter Your Email",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Wallet password",
                    prefixIcon: Icons.wallet,
                    validationMessage: "Please Enter Your Wallet password",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 55,
                      width: 205,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 51, 86, 116),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.info_outlined,
                                      color: Colors.white,
                                      size: 70,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "The cost of your flight reservation is \$100. Half of the amount will be deducted when you press OK",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //  Navigator.pushNamed(context, Success.id);
                                    },
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 51, 86, 116),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
