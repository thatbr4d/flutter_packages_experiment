import 'package:flutter/material.dart';

import '/business/models/dog_breed.dart';

class DogBreedsList extends StatelessWidget {
  const DogBreedsList({Key? key, required this.breeds}) : super(key: key);

  final List<DogBreed> breeds;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: breeds.length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          child: Center(
            child: Text(breeds[index].breed.toString()),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
