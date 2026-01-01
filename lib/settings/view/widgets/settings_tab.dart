import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Language', style: Theme.of(context).textTheme.titleMedium),
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
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'ar', child: Text('Arabic')),
              ],
              onChanged: (value) {
                selectedLang = value ?? 'en';
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
