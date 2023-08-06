import 'package:flutter/material.dart';

void main() {
  runApp(const SwitchApp());
}

/*
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
      home: SwitchApp(),
    );
  }
}
*/


class SwitchApp extends StatefulWidget {
  const SwitchApp({super.key});

  @override
  State<SwitchApp> createState() => _MyAppState();
}

class _MyAppState extends State<SwitchApp> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(_isDarkMode ? "Dark Theme" : "Light Theme")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Switch.adaptive(
                value: _isDarkMode,
                onChanged: _toggleDarkMode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
