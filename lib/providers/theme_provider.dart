import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false);

  void toggleTheme() {
    state = !state;
  }
}

final themProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider());
