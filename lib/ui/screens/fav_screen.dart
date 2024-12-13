import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/repose/hive_repos.dart';
import 'package:pokedex/ui/screens/pokemon_details_screen.dart';
import 'package:pokedex/utils/helpers.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<PokemonModel> favPokemon = [];
  final HiveRepo hiveRepo = HiveRepo();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      favPokemon = await hiveRepo.getAllFavPokeFromHive();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.white,
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('Fav Pokemon'),
              expandedTitleScale: 1.5,
              background: Image.asset(
                'images/image1.png',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          favPokemon.isNotEmpty
              ? SliverList.builder(
                  itemCount: favPokemon.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return PokemonDetailScreen(
                                  pokemon: favPokemon[index]);
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Helpers.getPokemonCardColor(
                                typeOfPokemon:
                                    favPokemon[index].typeofpokemon?.first ??
                                        ''),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  CachedNetworkImage(
                                    fit: BoxFit.fitWidth,
                                    width: 100,
                                    imageUrl: favPokemon[index].imageurl ?? '',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(), // Optional
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error), // Optional
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    favPokemon[index].name ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    favPokemon[index].typeofpokemon?.first ??
                                        '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await hiveRepo.deletePokeFromHive(
                                            favPokemon[index].id!);
                                        setState(() {
                                          favPokemon.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : SliverToBoxAdapter(
                  child: Center(
                    heightFactor: 20,
                    child: Text('No Favorite Pokemon added yet',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                )
        ],
      ),
    );
  }
}
