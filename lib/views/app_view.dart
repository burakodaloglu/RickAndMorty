import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: Text(
        "Rick and Morty",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
      ],
    );
  }
}
