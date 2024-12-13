import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/repose/hive_repos.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/ui/screens/all_pokemon_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdaptor();
  runApp(
    const ProviderScope(
      child: Pokedox(),
    ),
  );
}

class Pokedox extends ConsumerWidget {
  const Pokedox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(themProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AllPokemonScreen(),
      theme: AppTheme.themeData(isDark: isDark),
    );
  }
}
