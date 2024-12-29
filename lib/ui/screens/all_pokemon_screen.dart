import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/providers/pokemon_future_provider.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/ui/screens/fav_screen.dart';
import 'package:pokedex/ui/screens/pokemon_details_screen.dart';
import 'package:pokedex/utils/helpers.dart';

class AllPokemonScreen extends ConsumerWidget {
  const AllPokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<PokemonModel>> pokemonData =
        ref.watch(pokemonFutureProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {
                ref.read(themProvider.notifier).toggleTheme();
              },
              icon: const Icon(Icons.lightbulb_outline),
            )
          ],
          title: Text(
            'Pokedex',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: pokemonData.when(data: (pokemonList) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                itemCount: pokemonList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PokemonDetailScreen(
                            pokemon: pokemonList[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Helpers.getPokemonCardColor(
                              typeOfPokemon:
                                  pokemonList[index].typeofpokemon?.first ??
                                      ''),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -10,
                              right: -5,
                              child: Opacity(
                                opacity: 0.3,
                                child: ClipOval(
                                  child: Image.asset(
                                    fit: BoxFit.fill,
                                    width: 160,
                                    height: 160,
                                    'images/image3.png',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              right: -5,
                              child: Hero(
                                tag: pokemonList[index].id ?? '',
                                child: CachedNetworkImage(
                                  imageUrl: pokemonList[index].imageurl ?? '',
                                  width: 155,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  pokemonList[index].typeofpokemon?.first ?? '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Text(
                                pokemonList[index].name ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          );
        }, error: (error, stk) {
          return Center(
            child: Text('Failed to Fetch Pokemon, $error'),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
