import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_cubit.dart';
import 'package:tourism/pages/attrac_details.dart';
import 'package:tourism/widget/attrac_card.dart';

class attracPage extends StatelessWidget {
  static String id = "attrac";

  @override
  Widget build(BuildContext context) {
    final attractionCubit = BlocProvider.of<AttractionCubit>(context);
    BlocProvider.of<AttractionCubit>(context).fetchAttractions();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 51, 86, 116),
          title: const Text(
            "Atrractions",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              attractionCubit.searchAttractions(value);
                            },
                            decoration: const InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Explore the wonderful sight",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<AttractionCubit, AttractionState>(
                  builder: (context, state) {
                if (state is AttractionInitial ||
                    state is AttractionLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AttractionLoadedState) {
                  final attractions = state.attraction;

                  if (attractions.isEmpty) {
                    return const Center(child: Text('No data found.'));
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: attractions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            customCardAttrac(
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AttractonDetails(
                                              attraction: attractions[index],
                                              // review: Attracs[index].review,
                                            )));
                              },
                              attraction: attractions[index],
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is AttractionErrorState) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }
                return Container();
              }),
            ],
          ),
        ));
  }
}
