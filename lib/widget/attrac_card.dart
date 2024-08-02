import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_cubit.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_details_cubit.dart';
import 'package:tourism/model/attrac_model.dart';
import 'package:tourism/model/attraction_model.dart';

// ignore: camel_case_types
class customCardAttrac extends StatelessWidget {
  final Attraction attraction;
  final VoidCallback press;
  final double width;
  const customCardAttrac({
    required this.attraction,
    required this.press,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
              height: 210,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                attraction.attractionPhoto.isNotEmpty
                                    ? attraction.attractionPhoto
                                    : "lib/images/photo_2024-05-14_13-19-25.jpg",
                              ))),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      attraction.attractionName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Color(0XFF1B4158)),
                        Text(
                          attraction.city.cityName,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<AttractionCubit, AttractionState>(
                          builder: (context, state) {
                            bool isFavorited = false;
                            if (state is FavoriteStatusChanged) {
                              isFavorited = state.isFavorited;
                            }
                            return IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: isFavorited ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                BlocProvider.of<AttractionCubit>(context)
                                    .addToFavorite(attraction.id);
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
