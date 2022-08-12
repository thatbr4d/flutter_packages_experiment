class DogBreed {
  final String breed;
  final List<SubBreed>? subBreeds;

  DogBreed({required this.breed, required this.subBreeds});

  factory DogBreed.fromJson(String json, List<dynamic> sublist) {
    return DogBreed(breed: json, subBreeds: sublist.map((e) => SubBreed.fromJson(e)).toList());
  }
}

class SubBreed {
  final String breed;

  const SubBreed({required this.breed});

  factory SubBreed.fromJson(dynamic json) {
    return SubBreed(breed: json);
  }
}
