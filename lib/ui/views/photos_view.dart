import 'package:flutter/material.dart';

import '/business/interfaces/i_api_service.dart';
import '/business/services/service_registration.dart';

import '/business/models/photo.dart';

class PhotosView extends StatelessWidget {
  PhotosView({super.key});

  final IApiService _apiService = locator<IApiService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json Placeholder Photos"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: _apiService.fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  PhotosList({super.key, required this.photos});

  final List<Photo> photos;
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
