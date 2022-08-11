import 'package:flutter_packages_experiment/business/models/dog_breed.dart';

abstract class IApiService {
  Future<List<DogBreed>> fetchDogBreeds();
}
