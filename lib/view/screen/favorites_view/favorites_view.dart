import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/view/screen/favorites_view/favorites_viewModel.dart';
import 'package:rickandmorty/view/widget/character_card_listView.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesViewmodel>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoritesViewmodel>();
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                CharacterCardListView(characters: viewModel.characters)
              ],
            )),
      ),
    );
  }
}
