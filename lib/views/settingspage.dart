
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Switch(
            value: Provider.of<ThemeNotifier>(context).currentTheme.brightness == Brightness.dark,
            onChanged: (value) {
              Provider.of<ThemeNotifier>(context, listen: false).switchTheme();
            },
          ),
          Text(Provider.of<ThemeNotifier>(context).currentTheme.brightness == Brightness.dark ? 'Dark Theme' : "Light Theme",style: TextStyle(color:Provider.of<ThemeNotifier>(context).currentTheme.primaryColor ,fontSize: 30),),
        const Spacer(),
        ],
      ),
    );
  }
}