import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/network/dio_client.dart';
import 'package:pokedex/utils/constant.dart';

class PokemonRepo {
  final Ref ref;
  PokemonRepo(this.ref);

  Future<List<PokemonModel>> getAllPokemon() async {
    try {
      final response = await ref.read(dioProvider).get(pokemonApiUrl);
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.data);
        final List<PokemonModel> pokemonList = decodedJson
            .map<PokemonModel>((pokemon) => PokemonModel.fromJson(pokemon))
            .toList();

        return pokemonList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}

final pokemonRepoProvider = Provider<PokemonRepo>((ref) => PokemonRepo(ref));
