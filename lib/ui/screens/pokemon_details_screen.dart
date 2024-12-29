import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/repose/hive_repos.dart';
import 'package:pokedex/ui/widgets/rotating_widget.dart';
import 'package:pokedex/utils/helpers.dart';

import '../../providers/favorite_check_provider.dart';

class PokemonDetailScreen extends ConsumerWidget {
  PokemonDetailScreen({super.key, required this.pokemon});
  final PokemonModel pokemon;
  final HiveRepo hiveRepo = HiveRepo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoritePokemonsProvider).any(
          (fav) => fav.id == pokemon.id,
        );
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Helpers.getPokemonCardColor(
          typeOfPokemon: pokemon.typeofpokemon?.first ?? 'Grass'),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          pokemon.name ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () async {
                ref
                    .read(favoritePokemonsProvider.notifier)
                    .toggleFavorite(pokemon);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isFavorite
                          ? 'Removed from Favorites'
                          : 'Added to Favorites',
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              ))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: width / 2 - 125,
            child: const Opacity(opacity: 0.3, child: RotatingWidget()),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              height: height * 0.57,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    pokemon.xdescription ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Type',
                    value: pokemon.typeofpokemon?.join(', ') ?? '-',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Abilities',
                    value: pokemon.abilities?.join(', ') ?? '-',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Height',
                    value: pokemon.height ?? '',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Weight',
                    value: pokemon.weight ?? '',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Weaknesses',
                    value: pokemon.weaknesses?.join(', ') ?? '-',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Speed',
                    value: pokemon.speed?.toString() ?? '-',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Attack',
                    value: pokemon.attack?.toString() ?? '-',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Special Attack',
                    value: pokemon.special_attack?.toString() ?? '-',
                  ),
                  PokemonDetailsInRow(
                    width: width,
                    pokemon: pokemon,
                    title: 'Defense',
                    value: pokemon.defense?.toString() ?? '-',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: width / 2 - 125,
            child: Hero(
              tag: pokemon.id ?? '',
              child: Image.network(
                pokemon.imageurl ?? '',
                width: 250,
                height: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonDetailsInRow extends StatelessWidget {
  const PokemonDetailsInRow({
    super.key,
    required this.width,
    required this.pokemon,
    required this.title,
    required this.value,
  });

  final double width;
  final PokemonModel pokemon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              width: width * 0.36,
              child:
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
