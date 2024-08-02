import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tourism/pages/favorite.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/mybooking.dart';
import 'package:tourism/pages/profile.dart';

class curvedNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      // animationDuration: Duration(microseconds: 300),
      animationCurve: Curves.decelerate,
      buttonBackgroundColor: Color(0XFF2C516C),
      color: Color.fromARGB(255, 74, 122, 152),
      backgroundColor: Colors.white,
      height: 57,
      items: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Homepage.id);
            },
            icon: Icon(Icons.home_rounded),
            iconSize: 30,
            color: Colors.white),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, favouritPage.id);
            },
            icon: Icon(Icons.favorite_rounded),
            iconSize: 30,
            color: Colors.white),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyBooking.id);
            },
            icon: Icon(Icons.flight_outlined),
            iconSize: 30,
            color: Colors.white),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, profilePage.id);
            },
            icon: Icon(Icons.person),
            iconSize: 30,
            color: Colors.white),
      ],
    );
  }
}
