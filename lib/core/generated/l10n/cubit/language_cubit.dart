import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  static const _languageKey = 'app_language';

  LanguageCubit() : super(const LanguageState(Locale('en')));

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_languageKey) ?? 'en';
    emit(LanguageState(Locale(langCode)));
  }

  Future<void> toggleLanguage() async {
    final currentLang = state.locale.languageCode;
    final newLang = currentLang == 'en' ? 'ar' : 'en';

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, newLang);

    emit(LanguageState(Locale(newLang)));
  }
}
