import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/settings/view_model/settings_states.dart';
import 'package:news/settings/view_model/settings_view_model.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/home/view/screens/home_screen.dart';

void main() {
  // print(String.fromCharCode(0xe062));
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  NewsApp({super.key});
  final viewModel = SettingsViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.getLan();
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<SettingsViewModel, SettingsState>(
        builder: (context, state) {
          if (state is LanSuccess) {
            print('main state is GetLanSuccess');
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              routes: {HomeScreen.route: (_) => HomeScreen()},
              initialRoute: HomeScreen.route,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              locale: Locale(state.lan),
            );
          } else {
            if (state is GetLanError) {
              print(state.errorMessage);
            } else if (state is ChangeLanError) {
              print(state.errorMessage);
            }
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              routes: {HomeScreen.route: (_) => HomeScreen()},
              initialRoute: HomeScreen.route,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              locale: Locale('en'),
            );
          }
        },
      ),
    );
  }
}
