import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/view/screen/locations_view/locations_viewModel.dart';
import 'package:rickandmorty/view/widget/decorated_background.dart';

import '../../widget/appbar_widget.dart';
import 'locations_listView.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  void initState() {
    super.initState();
    context.read<LocationsViewmodel>().getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppbarWidget(
          title: 'Locations',
          transparentBackground: true,
        ),
        body: Center(
          child: DecoratedBackground(
            topChild: const SizedBox(height: 74),
            child: _locationListView(),
          ),
        ),
      ),
    );
  }

  Widget _locationListView() {
    return Consumer <LocationsViewmodel>(
      builder: (context, viewModel, child) {
        if (viewModel.locationModel == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: LocationListView(
              locationModel: viewModel.locationModel!,
              onLoadMore: viewModel.getMoreLocation,
              loadMore: viewModel.loadMore,
            ),
          );
        }
      },
    );
  }
}
