import 'package:flutter/material.dart';
import 'explore_screen.dart'; // Import file explore_screen.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Explore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExploreScreen(), // Gunakan ExploreScreen sebagai tampilan utama
    );
  }
}
