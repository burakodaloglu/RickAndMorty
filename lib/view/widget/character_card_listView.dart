import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/character.dart';
import '../screen/characters_view/charactersViewModel.dart';
import 'character_card_view.dart';

class CharacterCardListView extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback onLoadMore;
  final bool loadMore;
  const CharacterCardListView({super.key, required this.characters, required this.onLoadMore, this.loadMore=false});

  @override
  State<CharacterCardListView> createState() => _CharacterCardListViewState();
}

class _CharacterCardListViewState extends State<CharacterCardListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _detectScroll();
    super.initState();
  }

  void _detectScroll() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScroll - currentScroll <= 200) {
        widget.onLoadMore();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: widget.characters.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          final characterModel = widget.characters[index];
          return Column(
            children: [
              CharacterCardView(characterModel: characterModel),
              if (widget.loadMore && index == widget.characters.length - 1)
                const CircularProgressIndicator.adaptive()
            ],
          );
        },
      ),
    );
  }
}
