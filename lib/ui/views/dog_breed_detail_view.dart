import 'package:flutter/material.dart';

import '/ui/viewmodels/dog_breed_detail_viewmodel.dart';
import '/business/services/service_registration.dart';
import '/business/models/dog_breed.dart';

class DogBreedDetailView extends StatefulWidget {
  DogBreedDetailView({Key? key, required this.dogBreed}) : super(key: key);

  final model = locator.get<DogBreedDetailViewModel>();
  final DogBreed dogBreed;

  @override
  State<DogBreedDetailView> createState() => _DogBreedDetailViewState();
}

class _DogBreedDetailViewState extends State<DogBreedDetailView> {
  List<Future<Image>> _futures = [];

  @override
  Widget build(BuildContext context) {
    final List<String> breeds = [widget.dogBreed.breed];
    if (widget.dogBreed.subBreeds != null && widget.dogBreed.subBreeds!.isNotEmpty) {
      breeds.addAll(widget.dogBreed.subBreeds!.map((e) => e.breed).toList());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dogBreed.breed),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: _generateImageCards(breeds, context),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateImageCards(List<String> breeds, BuildContext context) {
    List<Widget> items = [];

    for (int i = 0; i < breeds.length; i++) {
      _futures.add(_getImageFuture(i, breeds));

      items.add(
        Column(
          children: [
            Card(
              child: Column(
                children: [
                  Text(
                    i == 0 ? "${breeds[i]} (Any)" : breeds[i],
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  FutureBuilder(
                    future: _futures[i],
                    builder: (context, AsyncSnapshot<Image> image) {
                      if (image.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator();
                      } else if (image.hasData) {
                        return Padding(padding: const EdgeInsets.all(5), child: image.data!);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay_outlined),
                    tooltip: 'Fetch a new random image',
                    onPressed: () {
                      setState(() {
                        _futures[i] = _getImageFuture(i, breeds);
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      );
    }

    return items;
  }

  Future<Image> _getImageFuture(int i, List<String> breeds) {
    return i == 0 ? widget.model.getBreedImage(breeds[i]) : widget.model.getSubBreedImage(widget.dogBreed.breed, breeds[i]);
  }
}
