import 'package:flutter/material.dart';
import 'package:project_lab5/settings.dart';

import 'activation.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedFactory = 'Factory 2';
  int currentIndex = 1; // Set default to home screen
  Color activeColor = Colors.lightBlue;

  final List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    _initializeScreens();
  }

  void _initializeScreens() {
    screens.clear();
    screens.addAll([
      selectedFactory == 'Factory 1'
          ? ProfileScreenF1(
        selectedFactory: selectedFactory,
        onFactorySelected: _onFactorySelected,
      )
          : ProfileScreenF2(
        selectedFactory: selectedFactory,
        onFactorySelected: _onFactorySelected,
      ),
      selectedFactory == 'Factory 1'
          ? HomeScreenF1(
        selectedFactory: selectedFactory,
        onFactorySelected: _onFactorySelected,
      )
          : HomeScreenF2(
        selectedFactory: selectedFactory,
        onFactorySelected: _onFactorySelected,
      ),
      SettingsScreen(
        selectedFactory: selectedFactory,
        onFactorySelected: _onFactorySelected,
      ),
    ]);
  }

  void _onFactorySelected(String factory) {
    setState(() {
      selectedFactory = factory;
      _initializeScreens();
      currentIndex = currentIndex; // Keep the current screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(currentIndex == 0
              ? 'Profile'
              : currentIndex == 1
              ? selectedFactory
              : 'Settings'),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.lock_person_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ActivationPage()),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: activeColor,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              _initializeScreens(); // Ensure the correct screen is loaded
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenF1 extends StatelessWidget {
  final String selectedFactory;
  final Function(String) onFactorySelected;

  const HomeScreenF1({super.key, required this.selectedFactory, required this.onFactorySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Container(
              width: 400,
              height: 550,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                'images/mobiledash.png', // Ensure you have this image in your assets folder
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
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
    );
  }
}

class HomeScreenF2 extends StatelessWidget {
  final String selectedFactory;
  final Function(String) onFactorySelected;

  const HomeScreenF2({super.key, required this.selectedFactory, required this.onFactorySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                'images/mobiledash2.png', // Ensure you have this image in your assets folder
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //dha
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
    );
  }
}


class FactoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(String) onFactorySelected;

  const FactoryButton({super.key, 
    required this.title,
    required this.isSelected,
    required this.onFactorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Set a fixed height for consistency
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          onFactorySelected(title);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.factory, size: 24, color: Colors.black), // Reduced icon size
            const SizedBox(height: 5),
            FittedBox( // Ensure text fits within the button
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



