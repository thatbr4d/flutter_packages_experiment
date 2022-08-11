import 'dart:convert';

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

    // This json isn't formatted very well, had to do this a little different
    final Map<String, dynamic> parsed = jsonDecode(response.body)["message"];

    return parsed.keys.map((e) => DogBreed.fromJson(e)).toList();
  }
}
