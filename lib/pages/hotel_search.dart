import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/pages/hotels.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';


class hotelSearch extends StatelessWidget {
   static String id = "hotels";
  final GlobalKey<FormState> keyhotel = GlobalKey<FormState>();

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
              key: keyhotel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Find Your Best Stay",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF1B4158)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    labelText: "Location",
                    prefixIcon: Icons.location_on,
                    validationMessage: "Please Enter The Location",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 4,
                          child: CustomTextField(
                            labelText: "In Date",
                            prefixIcon: Icons.calendar_month,
                            validationMessage: "Please Enter Your In Date",
                            keyboardType: TextInputType.datetime,
                          )),
                      SizedBox(
                        width: 7,
                      ),
                      Flexible(
                          flex: 4,
                          child: CustomTextField(
                            labelText: "Out Date",
                            prefixIcon: Icons.calendar_month,
                            validationMessage: "Please Enter Your Out Date",
                            keyboardType: TextInputType.datetime,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    labelText: "Rate",
                    prefixIcon: Icons.star,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 4,
                          child: CustomTextField(
                            labelText: "persons number",
                            prefixIcon: Icons.person_2,
                            keyboardType: TextInputType.number,
                          )),
                      SizedBox(
                        width: 7,
                      ),
                      Flexible(
                          flex: 4,
                          child: CustomTextField(
                            labelText: "Room number",
                            prefixIcon: Icons.home,
                            keyboardType: TextInputType.number,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: SizedBox(
                        width: 210,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (keyhotel.currentState?.validate() ?? false) {
                              Navigator.of(context).pushNamed(hotelPage.id);
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0XFF1B4158)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                          child: const Text(
                            "Search",
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
