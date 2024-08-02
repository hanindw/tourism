import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/model/attrac_model.dart';
import 'package:tourism/model/flight_custom_model.dart';
import 'package:tourism/model/flight_details_model.dart';
import 'package:tourism/model/hotel_model.dart';
import 'package:tourism/pages/attrac_details.dart';
import 'package:tourism/pages/attractions.dart';
import 'package:tourism/pages/detailsflight.dart';
import 'package:tourism/pages/flights.dart';
import 'package:tourism/pages/hotel_details.dart';
import 'package:tourism/pages/hotel_search.dart';
import 'package:tourism/pages/trips.dart';
import 'package:tourism/widget/attrac_card.dart';
import 'package:tourism/widget/customcardhotel.dart';
import 'package:tourism/widget/customcurved.dart';
import 'package:tourism/widget/customflight.dart';
import 'package:tourism/widget/customflighthome.dart';
import 'package:tourism/widget/hotel_card.dart';

class Homepage extends StatelessWidget {
  static String id = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: curvedNav(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(
                          "lib/images/photo_2024-05-12_13-29-56.jpg"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RichText(
                        text: const TextSpan(
                            text: "Hello",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: [
                          TextSpan(
                              text: ",Masa",
                              style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ])),
                    const SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          color: Color(0XFF1B4158),
                        ),
                        iconSize: 30)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: const Text("Explore your world Beauty",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 86, 116),
                          fontWeight: FontWeight.bold,
                          fontSize: 23)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Our Services",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, FlightPage.id);
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  "lib/images/photo_2024-05-14_03-57-24.jpg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text("Flights",
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.normal,
                                fontSize: 15)),
                      ],
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, hotelSearch.id);
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  "lib/images/photo_2024-05-14_03-57-37.jpg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text("Hotels",
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.normal,
                                fontSize: 15)),
                      ],
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, attracPage.id);
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  "lib/images/photo_2024-05-14_03-57-44.jpg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text("Attractions",
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.normal,
                                fontSize: 15)),
                      ],
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, tripPage.id);
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  "lib/images/photo_2024-05-14_03-57-31.jpg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text("Trips",
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.normal,
                                fontSize: 15)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Text("Flights available",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Container(
                    height: 198,
                    child: ListView.builder(
                        itemCount: Flights.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, right: 15),
                            child: Row(
                              children: [
                                FlightCardHome(
                                  press: () {
                                    Navigator.pushNamed(
                                      context,
                                      DetailsFlight.id,
                                      arguments: FlightsDet[index],
                                    );
                                  },
                                  width: 220,
                                  flightinfo: Flights[index],
                                )
                              ],
                            ),
                          );
                        })),
                SizedBox(
                  height: 15,
                ),
                Text("Top Hotels",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: hotels.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, right: 15),
                            child: Row(
                              children: [
                                hotelCard(
                                    hotelInfo: HotelInfo(
                                        review: hotels[index].review,
                                        Room: hotels[index].Room,
                                        location: hotels[index].location,
                                        image: hotels[index].image,
                                        name: hotels[index].name,
                                        description: hotels[index].description,
                                        amenities: hotels[index].amenities,
                                        rate: hotels[index].rate),
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  hotelDetails(
                                                    Room: hotels[index].Room,
                                                    imagePath:
                                                        hotels[index].image,
                                                    name: hotels[index].name,
                                                    location:
                                                        hotels[index].location,
                                                    description: hotels[index]
                                                        .description,
                                                    amenities:
                                                        hotels[index].amenities,
                                                    rate: hotels[index].rate,
                                                    review:
                                                        hotels[index].review,
                                                  )));
                                    },
                                    width: 160)
                              ],
                            ),
                          );
                        })),
                Text("Top Attractions",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Container(
                    height: 250,
                    child: ListView.builder(
                        itemCount: hotels.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, right: 15),
                            // child: Row(
                            //   children: [
                            //     customCardAttrac(
                            //       attraction: Attracs[index],
                            //       press: () {
                            //         Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => Scaffold(
                            //               body: Stack(
                            //                 children: [
                            //                   AttractonDetails(
                            //                     imagePath: Attracs[index].image,
                            //                     name: Attracs[index].name,
                            //                     location:
                            //                         Attracs[index].location,
                            //                     description:
                            //                         Attracs[index].description,
                            //                     review: Attracs[index].review,
                            //                   ),
                            //                   Positioned(
                            //                     top: 20,
                            //                     left: 10,
                            //                     child: IconButton(
                            //                       icon: Icon(
                            //                         Icons.arrow_back,
                            //                         color: Colors.white,
                            //                       ),
                            //                       onPressed: () {
                            //                         Navigator.pop(context);
                            //                       },
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       },
                            //       width: 194,
                            //     )
                            //   ],
                            // ),
                          );
                        })),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )),
        ));
  }
}
