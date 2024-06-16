import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class CommonWidget extends StatelessWidget {
  const CommonWidget({super.key, required this.title});
final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Center(child: Text(title,style: TextStyle(fontSize: 30,color: themeNotifier.currentTheme.primaryColor),),);
      }
    );
  }
}