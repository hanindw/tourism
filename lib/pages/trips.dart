import 'package:flutter/material.dart';
import 'package:tourism/model/trip_model.dart';
import 'package:tourism/pages/trip_details.dart';
import 'package:tourism/widget/trip_card.dart';

class tripPage extends StatelessWidget {
  static String id = "trip";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 51, 86, 116),
          title: const Text(
            "Trips",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Let's enjoy a beatiful journey",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                          children: [
                            TripCard(
                                TripInfo: tripInfo(
                                    fetuers: trips[index].fetuers,
                                    images: trips[index].images,
                                    age: trips[index].age,
                                    days: trips[index].days,
                                    details: trips[index].details,
                                    avalible: trips[index].avalible,
                                    tripProgramme: trips[index].tripProgramme,
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
                                                      fetuers:
                                                          trips[index].fetuers,
                                                      name: trips[index].name,
                                                      age: trips[index].age,
                                                      avalible:
                                                          trips[index].avalible,
                                                      days: trips[index].days,
                                                      details:
                                                          trips[index].details,
                                                      Price:
                                                          trips[index].price1,
                                                      tripProgramme:
                                                          trips[index]
                                                              .tripProgramme,
                                                      images:
                                                          trips[index].images),
                                                  Positioned(
                                                    top: 20,
                                                    left: 10,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.arrow_back,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ]),
                                              )));
                                }),
                          ],
                        ))),
          ],
        ));
  }
}
