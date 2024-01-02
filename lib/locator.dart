import "package:get_it/get_it.dart";
import "package:trendyol_store/data/product_api_client.dart";
import "package:trendyol_store/data/product_repository.dart";

GetIt locator =GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => ProductRepository());
  locator.registerLazySingleton(() => ProductApiClient());

}