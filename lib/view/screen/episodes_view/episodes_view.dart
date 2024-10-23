import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/view/screen/episodes_view/episodes_viewModel.dart';
import 'package:rickandmorty/view/widget/decorated_background.dart';
import 'package:rickandmorty/view/widget/episodes_listView.dart';

import '../../widget/appbar_widget.dart';

class EpisodesView extends StatefulWidget {
  const EpisodesView({super.key});

  @override
  State<EpisodesView> createState() => _EpisodesViewState();
}

class _EpisodesViewState extends State<EpisodesView> {
  @override
  void initState() {
    super.initState();
    context.read<EpisodesViewmodel>().getEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppbarWidget(
          title: 'Episodes',
          transparentBackground: true,
        ),
        body: DecoratedBackground(
          topChild: const SizedBox(height: 74),
          child: Consumer<EpisodesViewmodel>(
            builder: (context, viewModel, child) {
              if (viewModel.episodesModel == null) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: EpisodesListView(
                    episodes: viewModel.episodesModel!.episodes,
                    onLoadMore: viewModel.onLoadMore,
                    loadMore: viewModel.loadMore,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}