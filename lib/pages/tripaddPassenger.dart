import 'package:flutter/material.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class tripaddPassenger extends StatefulWidget {
  static String id = "booking";
  final int? passengersCount;
  final Function(PassengerData) onPassengerAdded;

  tripaddPassenger({this.passengersCount, required this.onPassengerAdded});

  @override
  State<tripaddPassenger> createState() => _tripaddPassengerState();
}

class _tripaddPassengerState extends State<tripaddPassenger> {
  final GlobalKey<FormState> keytrips = GlobalKey<FormState>();

  String? _GivenName;

  String? _LastName;

  String? _Country;

  DateTime? Date;

  bool _isPassengerChecked = false;

  void _addPassenger() {
    if (keytrips.currentState!.validate()) {
      keytrips.currentState!.save();

      PassengerData passengerData = PassengerData(
        name: _GivenName,
        lastname: _LastName,
        country: _Country,
        date: Date,
        isChecked: _isPassengerChecked,
      );

      widget.onPassengerAdded(passengerData);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 50, bottom: 15, right: 16),
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            key: keytrips,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Add Passenger",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF1B4158)),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    labelText: "First Name",
                    prefixIcon: Icons.person,
                    validationMessage: "Please Enter The First Name",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Last Name",
                    prefixIcon: Icons.person,
                    validationMessage: "Please Enter The Last Name",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Country",
                    prefixIcon: Icons.location_on,
                    validationMessage: "Please Enter The Country",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Date of Birth",
                    prefixIcon: Icons.date_range,
                    validationMessage: "Please Enter The Birth Date",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                        width: 210,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _addPassenger,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 51, 86, 116)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ))),
                          child: const Text(
                            "Add Passenger",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
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

class PassengerData {
  String? name;
  String? idNumber;
  String? lastname;
  String? country;
  DateTime? date;

  bool isChecked = false;

  PassengerData(
      {this.name,
      this.idNumber,
      this.country,
      this.date,
      this.lastname,
      required this.isChecked});
}
