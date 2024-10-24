import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/view/widget/appbar_widget.dart';

import '../../widget/character_card_listView.dart';
import 'charactersViewModel.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersViewmodel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharactersViewmodel>();
    return Scaffold(
      appBar: AppbarWidget(title: "Rick and Morty"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            children: [
              _searchInputWidget(context, viewModel: viewModel),
              viewModel.charactersModel == null
                  ? const CircularProgressIndicator.adaptive()
                  : CharacterCardListView(
                      characters: viewModel.charactersModel!.characters,
                      onLoadMore: () => viewModel.getCharactersMore(),
                      loadMore: viewModel.loadMore,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchInputWidget(BuildContext context,
      {required CharactersViewmodel viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: viewModel.getCharactersByName,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) => viewModel.onCharacterTypeChanged(value),
              itemBuilder: (context) {
                return ChatactersViewType.values
                    .map((e) => PopupMenuItem<ChatactersViewType>(
                          value: e,
                          child: Text(e.name),
                        ))
                    .toList();
              }),
        ),
      ),
    );
  }
}
