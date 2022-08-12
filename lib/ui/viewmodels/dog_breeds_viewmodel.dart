import 'package:flutter/foundation.dart';

import '/business/interfaces/i_api_service.dart';
import '/business/models/dog_breed.dart';
import '/business/services/service_registration.dart';

class DogBreedsViewModel extends ChangeNotifier {
  final IApiService _apiService = locator<IApiService>();

  List<DogBreed>? dogBreeds;
  List<DogBreed>? filteredDogBreeds;

  Future<List<DogBreed>> fetchDogBreeds() async {
    if (filteredDogBreeds == null) {
      filteredDogBreeds = await _apiService.fetchDogBreeds();
      dogBreeds = List.from(filteredDogBreeds!);
    }

    return Future<List<DogBreed>>.value(filteredDogBreeds);
  }

  filterDogBreeds(String search) {
    if (search.isEmpty) {
      filteredDogBreeds = List.from(dogBreeds!);
    } else {
      filteredDogBreeds = dogBreeds!
          .where((x) =>
              x.breed.toLowerCase().contains(search.toLowerCase()) ||
              (x.subBreeds != null && x.subBreeds!.any((sub) => sub.breed.toLowerCase().contains(search.toLowerCase()))))
          .toList();
    }

    notifyListeners();
  }
}
