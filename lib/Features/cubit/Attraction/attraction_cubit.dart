import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/attraction_model.dart';

part 'attraction_state.dart';

class AttractionCubit extends Cubit<AttractionState> {
  List<Attraction> favoriteAttractions = [];
  AttractionCubit() : super(AttractionInitial());

  void fetchAttractions() async {
    emit(AttractionLoadingState());

    try {
      String base_url = Api().base_url;

      final response = await Api().get(url: '$base_url/showAllAttraction');
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse is List) {
          final attractions = jsonResponse.map((attractionJson) {
            final attraction = Attraction.fromJson(attractionJson);
            return attraction;
          }).toList();

          emit(AttractionLoadedState(attractions));
        } else {
          emit(AttractionErrorState('Invalid response format'));
        }
      } else {
        emit(AttractionErrorState('Failed to fetch all attractions'));
      }
    } catch (e) {
      emit(AttractionErrorState('An error occurred'));
    }
  }

  void searchAttractions(String query) {
    final currentState = state;

    if (query.isEmpty) {
      fetchAttractions();
      return;
    }

    final normalizedQuery = query.toLowerCase();

    if (currentState is AttractionLoadedState) {
      final filteredAttractions = currentState.attraction.where((attraction) {
        final attractionName = attraction.attractionName.toLowerCase();
        final city = attraction.city.cityName.toLowerCase();

        return attractionName.contains(normalizedQuery) ||
            city.contains(normalizedQuery);
      }).toList();

      emit(AttractionLoadedState(filteredAttractions));
    }
  }

  Future<void> addToFavorite(int attractionId) async {
    emit(AttractionLoadingState());

    try {
      String base_url = Api().base_url;

      final response = await Api().get(
          url: '$base_url/addAttractionToFavorite/$attractionId', token: null);
      print('Adding attraction to favorites...');
      print(response.body);

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 1) {
          emit(FavoriteStatusChanged(isFavorited: true));
        } else {
          emit(AttractionErrorState(jsonResponse['message']));
        }
      } else {
        emit(AttractionErrorState('Failed to add attraction to favorites'));
        print(response.body);
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(AttractionErrorState('An error occurred'));
    }
  }
}
