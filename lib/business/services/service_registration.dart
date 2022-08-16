import 'package:get_it/get_it.dart';

import '/business/interfaces/i_api_service.dart';
import '/business/services/api_service.dart';
import '/business/services/connection_service.dart';
import '/ui/viewmodels/dog_breeds_viewmodel.dart';
import '/ui/viewmodels/dog_breed_detail_viewmodel.dart';
import '/ui/viewmodels/user_post_viewmodel.dart';
import 'cache_service.dart';

final locator = GetIt.instance;

void initLocator() {
  // services
  locator.registerSingleton<ConnectionService>(ConnectionService());
  locator.registerSingletonAsync<CacheService>(() async {
    final cacheService = CacheService();
    await cacheService.initialize();
    return cacheService;
  });
  locator.registerSingletonWithDependencies<IApiService>(() => ApiService(), dependsOn: [CacheService]);

  // view models
  locator.registerLazySingleton(() => DogBreedsViewModel());
  locator.registerLazySingleton(() => DogBreedDetailViewModel());
  locator.registerLazySingleton(() => UserPostViewModel());
}
