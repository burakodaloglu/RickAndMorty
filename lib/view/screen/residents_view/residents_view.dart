import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/model/locations_model.dart';
import 'package:rickandmorty/navigation/router.dart';
import 'package:rickandmorty/view/screen/residents_view/residents_viewModel.dart';
import 'package:rickandmorty/view/widget/appbar_widget.dart';
import 'package:rickandmorty/view/widget/character_card_listView.dart';

class ResidentsView extends StatefulWidget {
  final LocationItem locationItem;
  const ResidentsView({super.key, required this.locationItem});

  @override
  State<ResidentsView> createState() => _ResidentsViewState();
}

class _ResidentsViewState extends State<ResidentsView> {

  @override
  void initState() {
    super.initState();
    context.read<ResidentsViewmodel>().getResidents(widget.locationItem.residents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.locationItem.name),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column (
          children: [
            Consumer<ResidentsViewmodel>(builder: (context, viewModel, child){
            return CharacterCardListView(characters: viewModel.residents);
            }
            ),
          ],
        ),
      ),
    );
  }
}
