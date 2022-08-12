import 'package:flutter/material.dart';
import 'package:flutter_packages_experiment/business/services/service_registration.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '/business/models/dog_breed.dart';
import '/ui/components/dog_breeds_list.dart';
import '/ui/viewmodels/dog_breeds_viewmodel.dart';

class DogBreedsView extends StatelessWidget with GetItMixin {
  DogBreedsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = locator.get<DogBreedsViewModel>();

    // I think i can change all this with watchFuture... need to investigate
    final filteredDogBreeds = watchOnly((DogBreedsViewModel x) => x.filteredDogBreeds);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog Breeds"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => model.filterDogBreeds(value),
              decoration: const InputDecoration(labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            Expanded(
              child: FutureBuilder<List<DogBreed>>(
                future: model.fetchDogBreeds(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    return DogBreedsList(
                      breeds: snapshot.data!,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
