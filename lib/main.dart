import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatInfoScreen(),
    );
  }
}


class ChatInfoScreen extends StatelessWidget {
  const ChatInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://img.freepik.com/free-photo/man-suit-with-blue-shirt-that-says-uu-it_1340-37835.jpg?t=st=1690465454~exp=1690469054~hmac=ca46edf5dd1b0e8a3b52ca28412af97a1924c103fa720f600d547ea142fd36dc&w=360'),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const Divider(thickness: 2, color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Number'),
              subtitle: const Text('+1 (123) 456-7890'),
              onTap: () {
                // Add phone number handling
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Email'),
              subtitle: const Text('john.doe@example.com'),
              onTap: () {
                // Add email handling
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              subtitle: const Text('New York, USA'),
              onTap: () {
                // Add location handling
              },
            ),
          ],
        ),
      ),
    );
  }
}
