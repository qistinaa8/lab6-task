import 'package:flutter/material.dart';

import 'main.dart';

class ProfileScreenF1 extends StatelessWidget {
  final String selectedFactory;
  final Function(String) onFactorySelected;

  const ProfileScreenF1({super.key, required this.selectedFactory, required this.onFactorySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildContactCard('Kim Soo Men', '+60109219938'),
              _buildContactCard('Nazirul', '+601234567891'),
              _buildContactCard('Qistina', '+60123456789'),
              _buildContactCard('Sarah', '+60841450889'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InvitationPage()), // Navigate to new page
                );
              },
              child: const Icon(Icons.add),
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

  Widget _buildContactCard(String name, String phone) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(phone),
        leading: const Icon(Icons.person),
      ),
    );
  }
}

class ProfileScreenF2 extends StatelessWidget {
  final String selectedFactory;
  final Function(String) onFactorySelected;

  const ProfileScreenF2({super.key, required this.selectedFactory, required this.onFactorySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildContactCard('Park Hyung Sik', '+6010921901185'),
              _buildContactCard('Sarah', '+601209260891'),
              _buildContactCard('Luqman', '+601234520135'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InvitationPage()), // Navigate to new page
                );
              },
              child: const Icon(Icons.add),
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

  Widget _buildContactCard(String name, String phone) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(phone),
        leading: const Icon(Icons.person),
      ),
    );
  }
}


class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory 2'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invitation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Invite users',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(
                labelText: "Owner's Name",
                hintText: "Type here",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Owner's Phone Number",
                hintText: "Enter your phone number",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('images/malaysia_flag.png', width: 24), // Add the image of the flag in your assets folder
                      const SizedBox(width: 10),
                      const Text('+60'),
                    ],
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the submit action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // Change button color if needed
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}