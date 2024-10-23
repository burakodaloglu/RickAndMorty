import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../app/theme.dart';
import '../../widget/appbar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Settings'),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Dark Theme'),
                trailing: Switch(
                  value: context.watch<AppTheme>().themeMode == ThemeMode.dark,
                  onChanged: (v) => context.read<AppTheme>().toggleTheme(),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
