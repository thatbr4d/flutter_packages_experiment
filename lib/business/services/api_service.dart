import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_packages_experiment/business/interfaces/i_api_service.dart';
import 'package:flutter_packages_experiment/business/models/dog_breed.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static const String dogApi = 'https://dog.ceo/api/';
}

class ApiService implements IApiService {
  final _client = http.Client();

  @override
  Future<List<DogBreed>> fetchDogBreeds() async {
    final response = await _client.get(Uri.parse('${ApiConstants.dogApi}breeds/list/all'));
    return compute(parseDogBreeds, response.body);
  }

  static List<DogBreed> parseDogBreeds(String responseBody) {
    // This json isn't formatted very well, had to do this a little different
    final Map<String, dynamic> parsed = jsonDecode(responseBody)["message"];
    return parsed.entries.map((e) => DogBreed.fromJson(e.key, e.value)).toList();
  }

  @override
  Future<String> fetchRandomDogBreedImageUrl(String breed) async {
    final response = await _client.get(Uri.parse('${ApiConstants.dogApi}breed/$breed/images/random'));
    return jsonDecode(response.body)["message"];
  }

  @override
  Future<String> fetchRandomDogSubBreedImageUrl(String breed, String subBreed) async {
    final response = await _client.get(Uri.parse('${ApiConstants.dogApi}breed/$breed/$subBreed/images/random'));
    return jsonDecode(response.body)["message"];
  }
}
