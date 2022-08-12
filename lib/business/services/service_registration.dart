import 'package:get_it/get_it.dart';

import '/business/interfaces/i_api_service.dart';
import '/business/services/api_service.dart';
import '/ui/viewmodels/dog_breeds_viewmodel.dart';
import '/ui/viewmodels/dog_breed_detail_viewmodel.dart';

final locator = GetIt.instance;

void initLocator() {
  // services
  locator.registerLazySingleton<IApiService>(() => ApiService());

  // view models
  locator.registerLazySingleton(() => DogBreedsViewModel());
  locator.registerLazySingleton(() => DogBreedDetailViewModel());
}
