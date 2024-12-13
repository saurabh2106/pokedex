import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/repose/pokemon_repos.dart';

final pokemonFutureProvider =
    FutureProvider.autoDispose<List<PokemonModel>>((ref) async {
  return await ref.watch(pokemonRepoProvider).getAllPokemon();
});
