import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '/business/models/photo.dart';
import '/business/interfaces/i_api_service.dart';
import '/business/models/dog_breed.dart';
import '/business/services/connection_service.dart';
import '/business/services/service_registration.dart';
import '/business/models/user_post.dart';

class ApiConstants {
  static const String dogApi = 'https://dog.ceo/api/';
}

class ApiService implements IApiService {
  final _client = http.Client();
  final _connectionService = locator.get<ConnectionService>();

  @override
  Future<List<DogBreed>> fetchDogBreeds() async {
    if (await _connectionService.isConnected()) {
      final response = await _client.get(Uri.parse('${ApiConstants.dogApi}breeds/list/all'));

      return compute(parseDogBreeds, response.body);
    } else {
      // TODO return cached
      return Future<List<DogBreed>>.value(List.empty());
    }
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

  @override
  Future<List<Photo>> fetchPhotos() async {
    final response = await _client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    return compute(parsePhotos, response.body);
  }

  static List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  Future<UserPost> fetchFirstPost() async {
    final response = await _client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    final raw = response.body.replaceAll("\\n", "\\\\n");
    final parsed = jsonDecode(raw);
    return UserPost.fromJson(parsed);
  }
}
