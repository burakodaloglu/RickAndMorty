import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
              if (states.contains(MaterialState.selected)) {
                // Seçili durumda label'ın rengi primary olacak
                return TextStyle(color: Theme.of(context).colorScheme.primary);
              } else {
                // Seçili değilse label'ın rengi tertiary olacak
                return TextStyle(color: Theme.of(context).colorScheme.tertiary);
              }
            }),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
              if (states.contains(MaterialState.selected)) {
                // Seçili durumda ikonun rengi primary olacak
                return IconThemeData(color: Theme.of(context).colorScheme.primary);
              } else {
                // Seçili değilse ikonun rengi tertiary olacak
                return IconThemeData(color: Theme.of(context).colorScheme.tertiary);
              }
            }),
          ),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.face), label: "Characters"),
              NavigationDestination(icon: Icon(Icons.bookmark), label: "Favorites"),
              NavigationDestination(icon: Icon(Icons.location_on), label: "Locations"),
              NavigationDestination(icon: Icon(Icons.menu), label: "Episodes"),
            ],
          ),
        )
    );
  }
}
