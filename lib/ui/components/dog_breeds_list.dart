import 'package:flutter/material.dart';

import '/ui/views/dog_breed_detail_view.dart';
import '/business/models/dog_breed.dart';

class DogBreedsList extends StatelessWidget {
  const DogBreedsList({Key? key, required this.breeds}) : super(key: key);

  final List<DogBreed> breeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: breeds.length,
      itemBuilder: (context, index) {
        return Center(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DogBreedDetailView(
                            dogBreed: breeds[index],
                          )),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Center(
                      child: Text(breeds[index].breed.toString()),
                    ),
                    subtitle: Center(
                      child: Text(breeds[index].subBreeds == null ? "" : breeds[index].subBreeds!.map((e) => e.breed).join(", ")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
