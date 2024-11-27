import 'package:flutter/material.dart';
import '/screens/home.dart';
import '/screens/data.dart';
import '/screens/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blueAccent,
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w100,
              fontFamily: 'Roboto',
              color: Colors.blue[50],
              shadows: const [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black38,
                )
              ]),
        ),
      ),
      home: const NavigationMain(),
    );
  }
}

class NavigationMain extends StatefulWidget {
  const NavigationMain({Key? key}) : super(key: key);

  @override
  State<NavigationMain> createState() => _NavigationMainState();
}

class _NavigationMainState extends State<NavigationMain> {
  final List<Widget> _screens = [
    HomePage(title: 'Home Page'),
    DataPage(),
    ContactPage(),
  ];

  int _currentIndex = 0; // Initially showing the first screen (HomePage)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[
          _currentIndex], // Display the current screen based on _currentIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the current tab
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
