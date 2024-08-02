import 'package:flutter/material.dart';
import 'package:tourism/model/attrac_model.dart';
import 'package:tourism/model/hotel_model.dart';
import 'package:tourism/model/trip_model.dart';
import 'package:tourism/pages/attrac_details.dart';
import 'package:tourism/pages/hotel_details.dart';
import 'package:tourism/pages/trip_details.dart';
import 'package:tourism/widget/attrac_card.dart';

import 'package:tourism/widget/hotel_card.dart';
import 'package:tourism/widget/trip_card.dart';

class favouritPage extends StatelessWidget {
  static String id = "fav";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 51, 86, 116),
          title: const Text(
            "Favorite",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "Attractions"),
              Tab(text: "Hotels"),
              Tab(text: "Trips"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Attractions Page
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Attracs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          // customCardAttrac(
                          //   attracInfo: AttracInfo(
                          //       review: Attracs[index].review,
                          //       location: Attracs[index].location,
                          //       image: Attracs[index].image,
                          //       name: Attracs[index].name,
                          //       description: Attracs[index].description),
                          //   width: double.infinity,
                          //   press: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => Scaffold(
                          //           body: Stack(
                          //             children: [
                          //               AttractonDetails(
                          //                 imagePath: Attracs[index].image,
                          //                 name: Attracs[index].name,
                          //                 location: Attracs[index].location,
                          //                 description:
                          //                     Attracs[index].description,
                          //                 review: Attracs[index].review,
                          //               ),
                          //               Positioned(
                          //                 top: 20,
                          //                 left: 10,
                          //                 child: IconButton(
                          //                   icon: Icon(
                          //                     Icons.arrow_back,
                          //                     color: Colors.white,
                          //                   ),
                          //                   onPressed: () {
                          //                     Navigator.pop(context);
                          //                   },
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            // Hotels Page
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      clipBehavior: Clip.none,
                      physics: ClampingScrollPhysics(),
                      itemCount: hotels.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return hotelCard(
                            hotelInfo: HotelInfo(
                                Room: hotels[index].Room,
                                location: hotels[index].location,
                                image: hotels[index].image,
                                name: hotels[index].name,
                                description: hotels[index].description,
                                amenities: hotels[index].amenities,
                                rate: hotels[index].rate,
                                review: hotels[index].review),
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => hotelDetails(
                                            review: hotels[index].review,
                                            Room: hotels[index].Room,
                                            imagePath: hotels[index].image,
                                            name: hotels[index].name,
                                            location: hotels[index].location,
                                            description:
                                                hotels[index].description,
                                            amenities: hotels[index].amenities,
                                            rate: hotels[index].rate,
                                          )));
                            },
                            width: 120);
                      }),
                ),
              ],
            ),
            // Trips Page
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: trips.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                              children: [
                                TripCard(
                                    TripInfo: tripInfo(
                                        fetuers: trips[index].fetuers,
                                        images: trips[index].images,
                                        age: trips[index].age,
                                        days: trips[index].days,
                                        details: trips[index].details,
                                        avalible: trips[index].avalible,
                                        tripProgramme:
                                            trips[index].tripProgramme,
                                        price1: trips[index].price1,
                                        name: trips[index].name,
                                        date: trips[index].date,
                                        location: trips[index].location),
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Scaffold(
                                                    body: Stack(children: [
                                                      tripDetails(
                                                          fetuers: trips[index]
                                                              .fetuers,
                                                          name:
                                                              trips[index].name,
                                                          age: trips[index].age,
                                                          avalible: trips[index]
                                                              .avalible,
                                                          days:
                                                              trips[index].days,
                                                          details: trips[index]
                                                              .details,
                                                          Price: trips[index]
                                                              .price1,
                                                          tripProgramme: trips[
                                                                  index]
                                                              .tripProgramme,
                                                          images: trips[index]
                                                              .images),
                                                      Positioned(
                                                        top: 20,
                                                        left: 10,
                                                        child: IconButton(
                                                          icon: Icon(
                                                            Icons.arrow_back,
                                                            color: Colors.white,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                    ]),
                                                  )));
                                    }),
                              ],
                            ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
