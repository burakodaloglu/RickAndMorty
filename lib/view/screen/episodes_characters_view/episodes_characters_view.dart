import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/model/episode_model.dart';
import 'package:rickandmorty/view/screen/episodes_characters_view/episodes_characters_viewModel.dart';
import 'package:rickandmorty/view/widget/appbar_widget.dart';
import 'package:rickandmorty/view/widget/character_card_listView.dart';

class EpisodesCharactersView extends StatefulWidget {
  final EpisodeModel episodeModel;

  const EpisodesCharactersView({super.key, required this.episodeModel});

  @override
  State<EpisodesCharactersView> createState() => _EpisodesCharactersViewState();
}

class _EpisodesCharactersViewState extends State<EpisodesCharactersView> {
  
  @override
  void initState() {
    super.initState();
    context.read<EpisodesCharactersViewmodel>().getCharacters(widget.episodeModel);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.episodeModel.episode),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Consumer<EpisodesCharactersViewmodel>(
                builder: (context, viewModel, child) {
              return CharacterCardListView(
                characters: viewModel.characters,
              );
            })
          ],
        ),
      ),
    );
  }
}
