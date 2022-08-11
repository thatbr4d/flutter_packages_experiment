import 'package:flutter/material.dart';
import 'package:flutter_packages_experiment/business/models/dog_breed.dart';
import 'package:flutter_packages_experiment/ui/components/dog_breeds_list.dart';

import '/ui/viewmodels/dog_breeds_viewmodel.dart';

class DogBreedsView extends StatelessWidget {
  const DogBreedsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = DogBreedsViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog Breeds"),
      ),
      body: FutureBuilder<List<DogBreed>>(
        future: model.dogBreeds,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return DogBreedsList(breeds: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
