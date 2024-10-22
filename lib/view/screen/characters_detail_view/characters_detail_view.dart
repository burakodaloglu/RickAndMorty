import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/model/character_model.dart';
import 'package:rickandmorty/view/widget/decorated_background.dart';
import 'package:rickandmorty/view/widget/episodes_listView.dart';

import '../../../model/episode_model.dart';
import '../../widget/appbar_widget.dart';
import 'character_detail_viewModel.dart';

class CharactersDetailView extends StatefulWidget {
  final CharacterModel characterModel;

  const CharactersDetailView({super.key, required this.characterModel});

  @override
  State<CharactersDetailView> createState() => _CharactersDetailViewState();
}

class _CharactersDetailViewState extends State<CharactersDetailView> {
  @override
  void initState() {
    super.initState();
    context
        .read<CharacterDetailViewmodel>()
        .getEpisodes(widget.characterModel.episode);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppbarWidget(
          title: 'Character',
          transparentBackground: true,
        ),
        body: DecoratedBackground(
          topChild: _characterAvatar(context),
          child: Column(
            children: [
              const SizedBox(height: 13),
              _characterName(),
              const SizedBox(height: 15),
              _labelsView(context),
              const SizedBox(height: 38),
              _episodes(),
              const SizedBox(height: 15),
              _episodeListView(),
            ],
          ),
        ),
      ),
    );
  }

  Flexible _episodeListView() {
    return Flexible(
      child: Consumer<CharacterDetailViewmodel>(
        builder: (context, viewModel, child) {
          return EpisodesListView(episodes: viewModel.episodes);
        },
      ),
    );
  }

  Text _characterName() {
    return Text(
      widget.characterModel.name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Container _episodes() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        "Episodes (${widget.characterModel.episode.length})",
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }

  Padding _labelsView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39),
      child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 14,
          spacing: 7,
          children: [
            _labelWidget(context, label: widget.characterModel.status),
            _labelWidget(context, label: widget.characterModel.origin.name),
            _labelWidget(context, label: widget.characterModel.gender),
            _labelWidget(context, label: widget.characterModel.species),
          ]),
    );
  }

  Container _labelWidget(BuildContext context, {required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Padding _characterAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90, bottom: 55),
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: CircleAvatar(
          radius: 98,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.characterModel.image),
            radius: 95,
          ),
        ),
      ),
    );
  }
}
