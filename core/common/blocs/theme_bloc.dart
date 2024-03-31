import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../local_storage/local_storage.dart';
import '../../local_storage/local_storage_keys.dart';

abstract class ThemeEvent {}

class LoadInitialTheme extends ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

abstract class ThemeStates {}

class ThemeInitialState extends ThemeStates {}

class UpdatedThemeState extends ThemeStates {
  final bool isDark;

  UpdatedThemeState({required this.isDark});
}

// ThemeBloc to manage theme changes
class ThemeBloc extends Bloc<ThemeEvent, ThemeStates> {
  ThemeBloc() : super(ThemeInitialState()) {
    on<LoadInitialTheme>(loadInitialTheme);
    on<ToggleTheme>(toggleTheme);
  }

  Future<void> toggleTheme(
    ToggleTheme event,
    Emitter<ThemeStates> emit,
  ) async {
    final currentState = state as UpdatedThemeState;
    final bool newIsDark = !currentState.isDark;
    await persistTheme(newIsDark); // Save the theme mode to shared preferences
    emit(UpdatedThemeState(isDark: newIsDark));
  }

  Future<void> persistTheme(bool isDark) async {
    await LocalStorage.instance.writeBoolToLocalDb(
      key: LocalStorageKeys.instance.currentTheme,
      value: isDark,
    );
  }

  FutureOr<void> loadInitialTheme(
    LoadInitialTheme event,
    Emitter<ThemeStates> emit,
  ) async {
    final res = await LocalStorage.instance
        .readBoolFromLocalDb(key: LocalStorageKeys.instance.currentTheme);
    if (res != null) {
      emit(UpdatedThemeState(isDark: res));
    } else {
      emit(UpdatedThemeState(isDark: false));
    }
  }
}
