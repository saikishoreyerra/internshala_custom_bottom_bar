import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme;

  ThemeNotifier(this._currentTheme);

  ThemeData get currentTheme => _currentTheme;

  void switchTheme() {
    if (_currentTheme.brightness == Brightness.dark) {
      _currentTheme = lightTheme;
    } else {
      _currentTheme = darkTheme;
    }
    notifyListeners();
  }

}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  primaryColorDark:Colors.white ,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  // accentColor: Colors.blueAccent,
  // Add other theme properties as needed
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey.shade500,
  primaryColorDark:Colors.white ,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  // accentColor: Colors.redAccent,
  // Add other theme properties as needed
);
