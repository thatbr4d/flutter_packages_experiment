import 'package:flutter_packages_experiment/business/models/dog_breed.dart';
import 'package:flutter_packages_experiment/business/models/photo.dart';

abstract class IApiService {
  Future<List<DogBreed>> fetchDogBreeds();
  Future<String> fetchRandomDogBreedImageUrl(String breed);
  Future<String> fetchRandomDogSubBreedImageUrl(String breed, String subBreed);
  Future<List<Photo>> fetchPhotos();
}
