import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/settings/view_model/settings_states.dart';
import 'package:news/settings/view_model/settings_view_model.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/home/view/screens/home_screen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsViewModel>(
          create: (context) => SettingsViewModel()..getLan(),
        ),
        BlocProvider<NewsViewModel>(create: (context) => NewsViewModel()),
      ],
      // create: (context) => SettingsViewModel()..getLan(),
      child: BlocBuilder<SettingsViewModel, SettingsState>(
        builder: (context, state) {
          final local = (state is LanSuccess) ? state.lan : 'en';
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            routes: {HomeScreen.route: (_) => HomeScreen()},
            initialRoute: HomeScreen.route,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            locale: Locale(local),
          );
        },
      ),
    );
  }
}
