import 'package:flutter/material.dart';

@immutable
class LanguageState {
  final Locale locale;

  const LanguageState(this.locale);

  LanguageState copyWith({Locale? locale}) {
    return LanguageState(locale ?? this.locale);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageState && other.locale == locale;

  @override
  int get hashCode => locale.hashCode;
}
