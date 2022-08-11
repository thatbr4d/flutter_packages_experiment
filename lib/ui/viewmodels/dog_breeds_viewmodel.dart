import 'package:flutter_packages_experiment/business/interfaces/i_api_service.dart';
import 'package:flutter_packages_experiment/business/models/dog_breed.dart';
import 'package:flutter_packages_experiment/business/services/service_registration.dart';

class DogBreedsViewModel {
  final _apiService = locator<IApiService>();

  Future<List<DogBreed>> get dogBreeds => _apiService.fetchDogBreeds();
}
