import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Auth/logout_cubit.dart';
import 'package:tourism/pages/create_wallet.dart';
import 'package:tourism/pages/edit_Profile.dart';
import 'package:tourism/widget/LogoutDialog.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:tourism/widget/profile_card.dart';

class profilePage extends StatelessWidget {
  static String id = "profile";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding: const EdgeInsets.all(3.0),
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
                height: 7,
              ),
              const ProfileCard(info: "Hanin Dw ", icon: Icons.person),
              const ProfileCard(info: "Palestine", icon: Icons.flag),
              const ProfileCard(info: "Female", icon: Icons.person_2),
              const ProfileCard(info: "12/12/2001", icon: Icons.date_range),
              const ProfileCard(
                  info: "hanindowah@gmail.com", icon: Icons.email),
              const ProfileCard(info: "0993445567", icon: Icons.phone),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 150,
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, creatWallet.id);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(178, 158, 158, 158)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.attach_money,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Wallet",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                      width: 150,
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return LogoutDialog();
                            },
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(178, 158, 158, 158)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.logout_rounded,
                              size: 25,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Logout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ],
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
                        Navigator.pushNamed(context, editProfile.id);
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
                        "Edit Profile",
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
