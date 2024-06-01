
import 'package:flutter/material.dart';

import 'main.dart';

class SettingsScreen extends StatelessWidget {
final String selectedFactory;
final Function(String) onFactorySelected;

const SettingsScreen({super.key, required this.selectedFactory, required this.onFactorySelected});

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/settings.png', // Ensure you have this image in your assets folder
                  width: 400,
                  height: 500,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FactoryButton(
                          title: 'Factory 1',
                          isSelected: 'Factory 1' == selectedFactory,
                          onFactorySelected: onFactorySelected,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FactoryButton(
                          title: 'Factory 2',
                          isSelected: 'Factory 2' == selectedFactory,
                          onFactorySelected: onFactorySelected,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
}