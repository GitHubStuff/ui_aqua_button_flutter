import 'package:flutter/material.dart';
import 'package:ui_aqua_button_flutter/ui_aqua_button_flutter.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeWidget(context),
      floatingActionButton: null,
    );
  }

  Widget homeWidget(BuildContext context) {
    const uiAquaButton = AquaButton();
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('UI Aqua Button'),
          SizedBox(height: 20),
          uiAquaButton,
        ],
      ),
    );
  }
}
