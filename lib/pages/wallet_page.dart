import 'package:flutter/material.dart';
import 'package:tourism/pages/profile.dart';
import 'package:tourism/widget/customscaffold.dart';

class walletPage extends StatelessWidget {
  List<Map<String, dynamic>> activites = [
    {
      "activity": "flight",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
    {
      "activity": "hotel",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.remove
    },
    {
      "activity": "trip",
      "price": "\$7455",
      "date": "12/9/2024",
      "icon": Icons.remove
    },
    {
      "activity": "flight",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
    {
      "activity": "trip",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
    {
      "activity": "flight",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.remove
    },
    {
      "activity": "hotel",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
  ];
  static String id = "wallet";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 51, 86, 116),
        title: const Text(
          "My Wallet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, profilePage.id);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 51, 86, 116),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Total Encom",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: const Text(
                                "\$1290896",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(170),
                        ),
                        child: Container(
                          width: 150,
                          height: 150,
                          color: const Color.fromARGB(255, 197, 197, 197),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 10),
                            child: Icon(
                              Icons.attach_money,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Activites:",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 51, 86, 116)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  height: 400,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey), // إضافة حدود بلون رمادي
                    borderRadius: BorderRadius.circular(30), // تدوير الحواف
                  ),
                  child: ListView.builder(
                    itemCount: activites.length,
                    itemBuilder: (BuildContext context, int index) {
                      IconData icon = activites[index]['icon'];
                      Color iconColor =
                          Colors.green; // اللون الافتراضي للأيقونة
                      Color priceColor = Colors.green; // اللون الافتراضي للسعر

                      if (icon == Icons.remove) {
                        iconColor = Colors.red; // تغيير لون الأيقونة إلى الأحمر
                        priceColor = Colors.red; // تغيير لون السعر إلى الأحمر
                      }

                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                icon,
                                color: iconColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                activites[index]['activity'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 51, 86, 116)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                activites[index]['date'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                activites[index]['price'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: priceColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
