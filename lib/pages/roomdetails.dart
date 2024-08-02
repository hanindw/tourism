import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/pages/roombooking.dart';
import 'package:tourism/widget/customTextFiled.dart';

class RoomDetails extends StatelessWidget {
  static String id = "roomdetails";

  final ScrollController controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String price, image, name, description, sleeps, beds;
  final List<String> pictures;
  final List<String> fetuers;

  RoomDetails(
      {super.key,
      required this.price,
      required this.image,
      required this.name,
      required this.description,
      required this.sleeps,
      required this.beds,
      required this.pictures,
      required this.fetuers});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width;
    double itemHeight = 300;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: itemHeight,
                  width: itemWidth,
                  child: ListView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: pictures.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: itemWidth,
                        child: Image.asset(pictures[index], fit: BoxFit.cover),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 8,
                  child: Center(
                    child: IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        controller.animateTo(
                          controller.offset - itemWidth,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 8,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                      onPressed: () {
                        controller.animateTo(
                          controller.offset + itemWidth,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(18),
              height: 470,
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 209, 201, 201)),
                        children: description.split('\n').map((line) {
                          return TextSpan(
                            text: line,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 104, 101, 101)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.bed,
                          color: Color(0XFF1B4158),
                        ),
                        Text(
                          beds,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 104, 101, 101)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0XFF1B4158),
                        ),
                        Text(
                          sleeps,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 104, 101, 101)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Column(
                      children: List.generate(
                        fetuers.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0XFF1B4158),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                fetuers[index],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 104, 101, 101)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            "Price for night:  ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF1B4158)),
                          ),
                          Text(
                            price,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF1B4158)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                          width: 210,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Form(
                                        key: _formKey,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                'Booking your Room',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0XFF1B4158)),
                                              ),
                                              const SizedBox(height: 25),
                                              const CustomTextField(
                                                  labelText: "Full Name",
                                                  prefixIcon: Icons.person,
                                                  validationMessage:
                                                      "Please Enter Your Full Name"),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              const CustomTextField(
                                                labelText: "Phone Number",
                                                prefixIcon: Icons.phone,
                                                validationMessage:
                                                    "Please Enter Your Number",
                                                keyboardType:
                                                    TextInputType.phone,
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              const Row(
                                                children: [
                                                  Flexible(
                                                      flex: 4,
                                                      child: CustomTextField(
                                                        labelText: "In Date",
                                                        prefixIcon: Icons
                                                            .calendar_month,
                                                        validationMessage:
                                                            "Please Enter Your In Date",
                                                        keyboardType:
                                                            TextInputType
                                                                .datetime,
                                                      )),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Flexible(
                                                      flex: 4,
                                                      child: CustomTextField(
                                                        labelText: "Out Date",
                                                        prefixIcon: Icons
                                                            .calendar_month,
                                                        validationMessage:
                                                            "Please Enter Your Out Date",
                                                        keyboardType:
                                                            TextInputType
                                                                .datetime,
                                                      )),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const CustomTextField(
                                                labelText: "Wallet password",
                                                prefixIcon: Icons.wallet,
                                                validationMessage:
                                                    "Please Enter Your Wallet password",
                                              ),
                                              const SizedBox(height: 16),
                                              const Text(
                                                'When confirming your booking, 50% of the price will be deducted.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                price,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0XFF1B4158)),
                                              ),
                                              const SizedBox(height: 16),
                                              SizedBox(
                                                height: 50,
                                                width: 210,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          RoomBooking.id);
                                                    }
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                      const Color(0XFF1B4158),
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(35),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Confirm Booking',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0XFF1B4158)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ))),
                            child: const Text(
                              "Booking",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
