import 'package:flutter/material.dart';
import 'package:tourism/pages/creatwallet_success.dart';
import 'package:tourism/pages/wallet_page.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class creatWallet extends StatelessWidget {
  static String id = "creat wallet";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                "lib/images/wallet2.png",
                width: 400,
                height: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                labelText: "Your wallet balance",
                prefixIcon: Icons.attach_money,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                labelText: "Your Wallet Password",
                prefixIcon: Icons.wallet,
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
                        Navigator.pushReplacementNamed(
                            context, createwalletSuccess.id);
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
                        " Creat Wallet",
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
