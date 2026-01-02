import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/settings/view_model/settings_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends Cubit<SettingsState> {
  SettingsViewModel() : super(SettingsInitial());

  void changeLan(String newLan) async {
    try {
      emit(ChangeLanLoading());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', newLan);
      emit(ChangeLanSuccess(newLan));
    } catch (error) {
      emit(ChangeLanError(error.toString()));
    }
  }

  void getLan() async {
    try {
      emit(GetLanLoading());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final lan = prefs.getString('language') ?? 'en';
      emit(GetLanSuccess(lan));
    } catch (error) {
      emit(GetLanError(error.toString()));
    }
  }
}
