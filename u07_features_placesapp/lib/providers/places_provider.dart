import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u07_features_placesapp/models/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  void addPlace(Place place) {
    state = [place, ...state];
  }

  void removePlace(Place place) {
    state = state.where((statePlace) => statePlace.id != place.id).toList();
  }

  void insertPlace(Place place, int index) {
    final newState = List<Place>.from(state);
    newState.insert(index, place);
    state = newState;
  }
}

final placesProvider =
    StateNotifierProvider<PlacesNotifier, List<Place>>((ref) {
  return PlacesNotifier();
});
