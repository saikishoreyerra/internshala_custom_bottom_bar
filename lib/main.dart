import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_bottom_tab.dart';
import 'providers/theme_provider.dart';
import 'views/common_widget.dart';
import 'views/settingspage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier(lightTheme))
      ],
      child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  List<Widget> pages = [
    const CommonWidget(
      title: "Home",
    ),
    const CommonWidget(
      title: "Search",
    ),
    const CommonWidget(
      title: "Alarm",
    ),
    const SettingsPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return MaterialApp(
        theme: themeNotifier.currentTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Custom Bottom Nav Bar"),
          ),
          bottomNavigationBar: CustomBottomBar(
            currentIndex: _currentIndex,
            selectedColorOpacity: 0.9,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Home
              CustomBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                unselectedColor: themeNotifier.currentTheme.primaryColor,
                selectedColor: themeNotifier.currentTheme.primaryColor,
                activeIcon: Icon(
                  Icons.home,
                  color: themeNotifier.currentTheme.primaryColorDark,
                ),
              ),

              /// Search
              CustomBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
                unselectedColor: themeNotifier.currentTheme.primaryColor,
                selectedColor: themeNotifier.currentTheme.primaryColor,
                activeIcon: Icon(
                  Icons.search,
                  color: themeNotifier.currentTheme.primaryColorDark,
                ),
              ),

              /// Alaram
              CustomBottomBarItem(
                icon: const Icon(Icons.alarm),
                title: const Text("Alarm"),
                unselectedColor: themeNotifier.currentTheme.primaryColor,
                selectedColor: themeNotifier.currentTheme.primaryColor,
                activeIcon: Icon(
                  Icons.alarm,
                  color: themeNotifier.currentTheme.primaryColorDark,
                ),
              ),

              /// Settings
              CustomBottomBarItem(
                icon: const Icon(Icons.settings),
                title: const Text("Settings"),
                unselectedColor: themeNotifier.currentTheme.primaryColor,
                selectedColor: themeNotifier.currentTheme.primaryColor,
                activeIcon: Icon(
                  Icons.settings,
                  color: themeNotifier.currentTheme.primaryColorDark,
                ),
              ),
            ],
          ),
          body: pages[_currentIndex],
        ),
      );
    });
  }
}
