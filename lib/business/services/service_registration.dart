import 'package:flutter_packages_experiment/business/interfaces/i_api_service.dart';
import 'package:flutter_packages_experiment/business/services/api_service.dart';
import 'package:flutter_packages_experiment/ui/viewmodels/dog_breeds_viewmodel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initLocator() {
  // services
  locator.registerLazySingleton<IApiService>(() => ApiService());

  // view models
  locator.registerLazySingleton(() => DogBreedsViewModel());
}
