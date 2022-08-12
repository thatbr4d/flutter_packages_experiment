import 'package:flutter/material.dart';
import 'package:flutter_packages_experiment/business/services/service_registration.dart';
import 'package:flutter_packages_experiment/ui/views/dog_breeds_view.dart';

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
      home: DogBreedsView(),
    );
  }
}
