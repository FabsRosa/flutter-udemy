import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u06_forms_shoppinglistapp/models/grocery.dart';

class GroceriesNotifier extends StateNotifier<List<Grocery>> {
  GroceriesNotifier() : super([]);

  void addGrocery(Grocery grocery) {
    state = [...state, grocery];
  }

  void removeGrocery(Grocery grocery) {
    state =
        state.where((stateGrocery) => stateGrocery.id != grocery.id).toList();
  }

  void insertGrocery(Grocery grocery, int index) {
    final newState = List<Grocery>.from(state);
    newState.insert(index, grocery);
    state = newState;
  }
}

final groceriesProvider =
    StateNotifierProvider<GroceriesNotifier, List<Grocery>>((ref) {
  return GroceriesNotifier();
});
