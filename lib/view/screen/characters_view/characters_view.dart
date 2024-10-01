import 'package:flutter/material.dart';
import 'package:rickandmorty/view/widget/CharacterCardView.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              _searchInputWidget(context),
               const CharacterCardView(
                  image: "https://wildlifeimages.org/wp-content/uploads/2024/03/0001_AdobeStock_460169080.jpg",
                  name: "Eagle",
                  origin: "İnönü",
                  status: "Number One",
                  type: "Team"),
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchInputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Search",
          labelStyle:
          TextStyle(color: Theme
              .of(context)
              .colorScheme
              .onSurface),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.settings),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
