import 'package:flutter/material.dart';
import 'package:pet_feeder/utils/colors.dart';
import 'package:pet_feeder/widgets/drawer_widget.dart';
import 'package:pet_feeder/widgets/text_widget.dart';

class MyPetsScreen extends StatelessWidget {
  const MyPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for pets (replace with actual data from a database or state management)
    final List<Map<String, String>> pets = [
      {
        'name': 'Buddy',
        'age': '2',
        'breed': 'Golden Retriever',
        'image': 'assets/images/logo.png',
      },
      {
        'name': 'Mittens',
        'age': '3',
        'breed': 'Siamese Cat',
        'image': 'assets/images/logo.png',
      },
      {
        'name': 'Charlie',
        'age': '1',
        'breed': 'Beagle',
        'image': 'assets/images/logo.png',
      },
    ];

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Pet Feeder',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];

          return ListTile(
            leading: pet['image'] != null
                ? CircleAvatar(
                    backgroundImage: AssetImage(pet['image']!),
                  )
                : const CircleAvatar(
                    child: Icon(Icons.pets),
                  ),
            title: Text(pet['name'] ?? ''),
            subtitle: Text('${pet['breed']} - ${pet['age']} years old'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetDetailsPage(pet: pet),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PetDetailsPage extends StatelessWidget {
  final Map<String, String> pet;

  const PetDetailsPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pet['name'] ?? 'Pet Details',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: pet['image'] != null
                  ? Image.asset(
                      pet['image']!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200,
                      width: 200,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.pets,
                        size: 100,
                        color: Colors.grey[700],
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${pet['name']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Age: ${pet['age']} years old',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Breed: ${pet['breed']}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
