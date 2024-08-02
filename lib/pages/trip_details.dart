import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/pages/tripBooking.dart';

class tripDetails extends StatefulWidget {
  static String id = "tripdet";
  final String name, age, avalible, days, details, Price, tripProgramme;
  final List images;
  final List<String> fetuers;

  tripDetails(
      {Key? key,
      required this.name,
      required this.age,
      required this.avalible,
      required this.days,
      required this.details,
      required this.fetuers,
      required this.Price,
      required this.tripProgramme,
      required this.images})
      : super(key: key);
  @override
  State<tripDetails> createState() => _tripDetailsState();
}

class _tripDetailsState extends State<tripDetails> {
  var selectedImage;
  void initState() {
    super.initState();
    selectedImage = widget.images[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        padding: const EdgeInsets.all(16),
        height: 370,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          image: DecorationImage(
            image: AssetImage(selectedImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedImage = widget.images[index];
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(widget.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
          child: Container(
              //height: 450,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                              ),
                              // اضبط أبعاد الصورة لتكون مربعة
                              width: 50.0,
                              height: 40.0,
                              child: const Icon(
                                Icons.group,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                            const Text(
                              "Age",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              widget.age,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                              ),
                              // اضبط أبعاد الصورة لتكون مربعة
                              width: 45.0,
                              height: 45.0,
                              child: const Icon(
                                Icons.calendar_today,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                            const Text(
                              "Days",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              widget.days,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                              ),
                              // اضبط أبعاد الصورة لتكون مربعة
                              width: 45.0,
                              height: 45.0,
                              child: const Icon(
                                Icons.done,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                            const Text(
                              "Avalible",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              widget.avalible,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Details:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 209, 201, 201)),
                        children: widget.details.split('\n').map((line) {
                          return TextSpan(
                            text: line,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 104, 101, 101)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Trip programme:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 209, 201, 201)),
                        children: widget.tripProgramme.split('\n').map((line) {
                          return TextSpan(
                            text: line,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 104, 101, 101)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Fetuers:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Column(
                      children: List.generate(
                        widget.fetuers.length,
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
                                widget.fetuers[index],
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
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            "Price for the trip:  ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF1B4158)),
                          ),
                          Text(
                            widget.Price,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 210,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, tripBooking.id);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 51, 86, 116),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Booking the trip',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ]))))
    ]));
  }
}
