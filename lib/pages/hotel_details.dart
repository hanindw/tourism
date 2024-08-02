import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/model/hotel_model.dart';
import 'package:tourism/model/room_model.dart';
import 'package:tourism/pages/roomdetails.dart';
import 'package:tourism/widget/customscaffold.dart';

// ignore: must_be_immutable
class hotelDetails extends StatelessWidget {

   static String id = "hotelsdet";

  final String imagePath;
  List<RoomInfo> Room;
  final String name;
  final String location;
  final String description;
  final int rate;
  final List<Map<String, dynamic>> amenities;
    List<Map<String, String>> review;

  hotelDetails(
      {super.key,
      required this.review,
      required this.Room,
      required this.imagePath,
      required this.name,
      required this.location,
      required this.description,
      required this.amenities,
      required this.rate});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        imagePath: imagePath,
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0XFF1B4158),
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            location,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: List.generate(
                          rate,
                          (index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Details:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 10,
                              color: const Color.fromARGB(255, 209, 201, 201)),
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Amenities:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Container(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: amenities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5),
                                    ),
                                    // اضبط أبعاد الصورة لتكون مربعة
                                    width: 78.0,
                                    height: 55.0,
                                    child: Column(
                                      children: [
                                        Icon(
                                          amenities[index]['icon'],
                                          size: 20,
                                        ),
                                        Text(
                                          amenities[index]['text'],
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 12,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rooms:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Room.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Scaffold(
                                          body: Stack(
                                            children:[ RoomDetails(
                                                price:
                                                    hotels[index].Room[index].price,
                                                image:
                                                    hotels[index].Room[index].image,
                                                name:
                                                    hotels[index].Room[index].name,
                                                description: hotels[index]
                                                    .Room[index]
                                                    .description,
                                                sleeps: hotels[index]
                                                    .Room[index]
                                                    .sleeps,
                                                beds:
                                                    hotels[index].Room[index].beds,
                                                pictures: hotels[index]
                                                    .Room[index]
                                                    .pictures,
                                                fetuers: hotels[index]
                                                    .Room[index]
                                                    .fetuers),
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

                                                               ] ),
                                        )));
                              },
                              child: Column(
                                children: [
                                  Material(
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        height: 110,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            Room[index]
                                                                .image))),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    Room[index].name,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    Room[index].price,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            );
                          }),
                          Text(
                        "Reviews:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0XFF1B4158)),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: review.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color(0XFF2C516C).withOpacity(0.9),
                                  child:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(0.1),
                                  height: 70,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 0.3),
                                      color: Color.fromARGB(255, 233, 233, 233),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: ListTile(
                                    title: Text(
                                      review[index]['name']!,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0XFF1B4158)),
                                    ),
                                    subtitle: Text(review[index]['comment']!,
                                        style: TextStyle(fontSize: 12)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                      Text("Add Comment"),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon:
                              Icon(Icons.send, color: Color(0XFF2C516C)),
                          prefixIcon: Icon(Icons.comment,
                              color: Color.fromARGB(255, 201, 198, 198)),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0XFF1B4158),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0XFF1B4158),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
