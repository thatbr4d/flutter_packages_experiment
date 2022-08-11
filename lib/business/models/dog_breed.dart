class DogBreed {
  final String breed;

  const DogBreed({required this.breed});

  factory DogBreed.fromJson(String json) {
    return DogBreed(breed: json);
  }
}
