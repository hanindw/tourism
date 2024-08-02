part of 'attraction_cubit.dart';

sealed class AttractionState {}

final class AttractionInitial extends AttractionState {}

class AttractionLoadingState extends AttractionState {}

class AttractionLoadedState extends AttractionState {
  final List<Attraction> attraction;

  AttractionLoadedState(this.attraction);
}

class FavoriteStatusChanged extends AttractionState {
  final bool isFavorited;

  FavoriteStatusChanged({required this.isFavorited});
}

class AttractionErrorState extends AttractionState {
  final String errorMessage;

  AttractionErrorState(this.errorMessage);
}
