import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key, required this.onItemTapped, required this.selectedIndex}) : super(key: key);

  final int selectedIndex;
  final Function(dynamic) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: 'Dogs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.picture_as_pdf),
          label: 'PDF',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.web),
          label: 'HTML',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo),
          label: 'Photos',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
