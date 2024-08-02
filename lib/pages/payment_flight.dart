import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tourism/model/payment_flight_model.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/pages/success.dart';
import 'package:tourism/widget/customscaffold.dart';

class Payment_Flight extends StatefulWidget {
  static String id = "paymentflight";
  PaymentFlight paymentflight;

  Payment_Flight({super.key, required this.paymentflight});

  @override
  State<Payment_Flight> createState() => Payment_FlightState();
}

class Payment_FlightState extends State<Payment_Flight> {
  DateTime? startDate;

  @override
  Widget build(BuildContext context) {
    // PaymentFlight paymentflight=ModalRoute.of(context)!.settings.arguments as PaymentFlight;
    PaymentFlight paymentflight = PaymentFlight(
        nyc: 'Syria',
        time: '3H 30M',
        ldn: 'Egypt',
        date: '1/7/2024',
        price: '250',
        number: '23');
    return CustomScaffold(
        imagePath: "lib/images/Android Small - 1.png",
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(right: 265),
                          child: Text(" Payment..",
                              style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Container(
                                    height: 168,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: const [
                                              Color(0XFF2C516C),
                                              Color.fromARGB(255, 202, 206, 207)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: const [0.5, 0.5]),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "NYC",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Transform.rotate(
                                                angle: -30,
                                                child: Icon(
                                                  Icons.flight,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text("LDN",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                paymentflight.nyc,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(paymentflight.time,
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(paymentflight.ldn,
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 11,
                                          ),
                                          Text(
                                            "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
                                            style: TextStyle(
                                              color: Color(0XFF2C516C),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                paymentflight.date,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                              Text(paymentflight.number,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16)),
                                              Text(paymentflight.price,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16))
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Date",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text("Number",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("Total price",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                            ],
                                          )
                                        ]))),
                                Positioned(
                                    left: -5,
                                    bottom: 0,
                                    top: 0,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: -5,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              color: Color(0XFF1B4158),
                                              width: 0.9999),
                                        ),
                                        hintText: "Card Number",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                        prefixIcon: Icon(
                                          Icons.sim_card_rounded,
                                          color: Color(0XFF1B4158),
                                        )),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 0.01,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              color: Color(0XFF1B4158),
                                              width: 0.9999),
                                        ),
                                        hintText: "Card Holder Name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                        prefixIcon: Icon(
                                          Icons.person_pin,
                                          color: Color(0XFF1B4158),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    height: 70,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          // fillColor: Color.fromARGB(255, 237, 236, 236),
                                          fillColor: Colors.white,
                                          labelText: 'CVV',
                                          labelStyle: TextStyle(
                                            color: Color(0XFF1B4158),
                                          ),
                                          hintText: "CVV",
                                          hintStyle: TextStyle(
                                              color: Color(0XFF1B4158),
                                              fontSize: 13),
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            borderSide: BorderSide(
                                                color: Color(0XFF1B4158),
                                                width: 0.9999),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Color(0XFF1B4158),
                                          )),
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 70,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                          controller: TextEditingController(
                                              text:
                                                  startDate?.toIso8601String()),
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            labelText: 'Expiry',
                                            labelStyle: TextStyle(
                                              color: Color(0XFF1B4158),
                                            ),
                                            hintText: "Expiry",
                                            hintStyle: TextStyle(
                                                color: Color(0XFF1B4158),
                                                fontSize: 13),
                                            filled: true,
                                            prefixIcon: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 30,
                                              color: Color(0XFF1B4158),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0XFF1B4158),
                                                  width: 0.9999),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Color(0XFF1B4158),
                                            )),
                                          ),
                                          onTap: () async {
                                            DateTime? result =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2100),
                                            );
                                            if (result != null) {
                                              setState(() {
                                                startDate = result;
                                              });
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                  height: 75,
                                  width: 240,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Color(0XFF1B4158),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        // Navigator.pushReplacementNamed(context, Success.id);
                                      },
                                      child: const Text(
                                        "Confirm",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            height: 0.1),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  height: 75,
                                  width: 240,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Color.fromARGB(
                                              255, 237, 236, 236),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, ResultFlight.id);
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Color(0XFF1B4158),
                                            fontSize: 18,
                                            height: 0.1),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ))));
  }
}
