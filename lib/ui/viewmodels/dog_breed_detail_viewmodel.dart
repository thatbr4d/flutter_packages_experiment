import 'package:flutter/widgets.dart';

import '/business/services/service_registration.dart';
import '/business/interfaces/i_api_service.dart';

class DogBreedDetailViewModel extends ChangeNotifier {
  final IApiService _apiService = locator<IApiService>();

  Future<Image> getBreedImage(String breed) async {
    return Image.network(await _apiService.fetchRandomDogBreedImageUrl(breed));
  }

  Future<Image> getSubBreedImage(String breed, String subBreed) async {
    return Image.network(await _apiService.fetchRandomDogSubBreedImageUrl(breed, subBreed));
  }
}
