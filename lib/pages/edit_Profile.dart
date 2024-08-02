import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/pages/profile.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class editProfile extends StatelessWidget {
  static String id = "edit";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 51, 86, 116),
                    size: 70,
                  ),
                ),
              )),
              const SizedBox(
                height: 25,
              ),
              const CustomTextField(
                labelText: "Full Name",
                prefixIcon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                labelText: "Nationality",
                prefixIcon: Icons.flag,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                labelText: "",
                prefixIcon: Icons.person_2,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                labelText: "Birth Date",
                prefixIcon: Icons.date_range,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                labelText: "Email",
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                labelText: "Phone Number",
                prefixIcon: Icons.phone,
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
                        Navigator.pushNamed(context, profilePage.id);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 51, 86, 116)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ))),
                      child: const Text(
                        " Save Edits",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
