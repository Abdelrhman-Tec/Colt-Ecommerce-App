import 'package:colt_ecommerce_app/core/theme/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.system)) {
    _loadTheme();
  }

  Future<void> toggleTheme() async {
    final newMode = state.themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    emit(ThemeState(newMode));
    await _saveTheme(newMode);
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.toString().split('.').last);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('themeMode');

    if (themeString != null) {
      switch (themeString) {
        case 'light':
          emit(const ThemeState(ThemeMode.light));
          break;
        case 'dark':
          emit(const ThemeState(ThemeMode.dark));
          break;
        default:
          emit(const ThemeState(ThemeMode.system));
      }
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    emit(ThemeState(mode));
    await _saveTheme(mode);
  }
}
