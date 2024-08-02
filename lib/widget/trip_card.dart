import 'package:flutter/material.dart';
import 'package:tourism/model/trip_model.dart';


class TripCard extends StatelessWidget {
  final ScrollController controller = ScrollController();
  double itemWidth = 350;
  double itemHeight = 180;

  final tripInfo TripInfo;
  final VoidCallback press;

  TripCard({super.key, required this.TripInfo, required this.press});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 7,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: itemHeight,
                  width: itemWidth,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: TripInfo.images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: itemWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(TripInfo.images[index],
                            fit: BoxFit.cover),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 7,
            left: 8,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  controller.animateTo(
                    controller.offset - itemWidth,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 7,
            right: 8,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  controller.animateTo(
                    controller.offset + itemWidth,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          Positioned(
              bottom: 12,
              left: 14,
              child: Container(
                padding: EdgeInsets.only(left: 16),
                width: 330,
                // height: 60,
                color: Colors.white.withOpacity(0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      TripInfo.name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0XFF1B4158),
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Color(0XFF1B4158),
                          size: 14,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          TripInfo.date,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Color(0XFF1B4158),
                          size: 16,
                        ),
                        Text(
                          TripInfo.location,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border_outlined,
                          ),
                          color: Color(0XFF1B4158),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
