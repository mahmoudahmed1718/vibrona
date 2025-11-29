import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  void updateTheme(ThemeMode thememode) => emit(thememode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeIndex = json['themeMode'] as int?;
    if (themeIndex == null) return null;
    return ThemeMode.values[themeIndex];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    final themeIndex = state.index;
    return {'themeMode': themeIndex};
  }
}
