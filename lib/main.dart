import 'package:flutter/material.dart';

import '/business/services/service_registration.dart';
import '/ui/components/bottom_nav_bar.dart';
import '/ui/views/dog_breeds_view.dart';
import '/ui/views/html_main_view.dart';
import '/ui/views/pdf_main_view.dart';

void main() {
  initLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Experiments',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainView());
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  final screens = [
    DogBreedsView(),
    const PDFMainView(),
    const HtmlMainView(),
  ];

  @override
  initState() {
    super.initState();
  }

  _onItemTapped(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNav(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
