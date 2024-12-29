import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/repose/hive_repos.dart';

class FavoritePokemonsNotifier extends StateNotifier<List<PokemonModel>> {
  FavoritePokemonsNotifier(this.hiveRepo) : super([]) {
    loadFavorites();
  }

  final HiveRepo hiveRepo;

  Future<void> loadFavorites() async {
    state = await hiveRepo.getAllFavPokeFromHive();
  }

  Future<void> toggleFavorite(PokemonModel pokemon) async {
    final isAlreadyInFavorite = state.any(
      (element) => element.id == pokemon.id,
    );

    if (isAlreadyInFavorite) {
      state = state
          .where(
            (favorite) => favorite.id != pokemon.id,
          )
          .toList();
      await hiveRepo.deletePokeFromHive(pokemon.id!);
    } else {
      state = [...state, pokemon];
      hiveRepo.addPokemonToHive(pokemon);
    }
  }

  bool isFav(String id) {
    return state.any((pokemon) => pokemon.id == id);
  }
}

final favoritePokemonsProvider =
    StateNotifierProvider<FavoritePokemonsNotifier, List<PokemonModel>>(
  (ref) => FavoritePokemonsNotifier(HiveRepo()),
);
