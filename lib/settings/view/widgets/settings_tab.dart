import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/settings/view_model/settings_states.dart';
import 'package:news/settings/view_model/settings_view_model.dart';
import 'package:news/shared/app_theme.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLang = 'en';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsViewModel, SettingsState>(
      builder: (context, state) {
        if (state is GetLanSuccess || state is ChangeLanSuccess) {
          print('settings state is getLanSuccess or ChangeLanSuccess');
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.primary, width: 2),
                  ),
                  child: DropdownButton<String>(
                    value: (state as LanSuccess).lan,
                    underline: SizedBox(), // Remove default underline
                    isExpanded: true, // Makes dropdown take full width
                    style: Theme.of(context).textTheme.titleMedium,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(AppLocalizations.of(context)!.english),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(AppLocalizations.of(context)!.arabic),
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                      context.read<SettingsViewModel>().changeLan(
                        value ?? 'en',
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          if (state is GetLanError) {
            print(state.errorMessage);
          } else if (state is ChangeLanError) {
            print(state.errorMessage);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.primary, width: 2),
                  ),
                  child: DropdownButton<String>(
                    value: selectedLang,
                    underline: SizedBox(), // Remove default underline
                    isExpanded: true, // Makes dropdown take full width
                    style: Theme.of(context).textTheme.titleMedium,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(AppLocalizations.of(context)!.english),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(AppLocalizations.of(context)!.arabic),
                      ),
                    ],
                    onChanged: (value) {
                      context.read<SettingsViewModel>().changeLan(
                        value ?? 'en',
                      );
                      selectedLang = value ?? "en";
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
      // child:
    );
  }
}
