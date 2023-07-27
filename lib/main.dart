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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 30),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, size: 30),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blue,
        elevation: 4.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        flexibleSpace: FlexibleSpaceBar(
          title: const Text(
            'Welcome to My App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          background: Image.network(
            'https://img.freepik.com/premium-photo/wood-table-with-seascape-palm-leaves-oil-canvas-painting-style_743855-2864.jpg?w=740',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: const Center(
        child: Text('Main Content'),
      ),
    );
  }
}
