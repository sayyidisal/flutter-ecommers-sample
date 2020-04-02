import 'package:ecommers/core/app_services/category_service.dart';
import 'package:ecommers/core/app_services/index.dart';
import 'package:ecommers/core/cache/index.dart';
import 'package:ecommers/core/common/file_manager.dart';
import 'package:ecommers/core/services/api_service.dart';
import 'package:ecommers/core/services/membership_service.dart';
import 'package:ecommers/core/services/navigation/navigation_service.dart';
import 'package:ecommers/web_server/request_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommers/core/services/extensions/get_it_extension.dart';

NavigationService get navigationService => GetIt.I.get<NavigationService>();
FileManager get fileManager => GetIt.I.get<FileManager>();
ApiService get apiService => GetIt.I.get<ApiService>();
MembershipService get membershipService => GetIt.I.get<MembershipService>();
RequestHandler get requestHandler => GetIt.I.get<RequestHandler>();
AuthorizationService get authorizationService =>
    GetIt.I.get<AuthorizationService>();
ProductService get productService => GetIt.I.get<ProductService>();
CategoryService get categoryService => GetIt.I.get<CategoryService>();
CacheDataRepository get cacheDataProvider => GetIt.I.get<CacheDataRepository>();
CacheDatabase get cacheDatabase => GetIt.I.get<CacheDatabase>();

class DependencyService {
  static void registerDependencies() {
    final GetIt serviceLocator = GetIt.instance;

    serviceLocator
      ..registerLazySingleton<NavigationService>(() => NavigationService())
      ..registerLazySingleton<FileManager>(() => FileManager())
      ..registerLazySingleton<RequestHandler>(() => RequestHandler())
      ..registerLazySingleton<AuthorizationService>(
          () => AuthorizationService())
      ..registerLazySingleton<ProductService>(() => ProductService())
      ..registerLazySingleton<CategoryService>(() => CategoryService())
      ..registerLazySingleton<MembershipService>(
          () => MembershipService(const FlutterSecureStorage()))
      ..registerHttpClient()
      ..registerLazySingleton<CacheDataRepository>(() => CacheDataRepository())
      ..registerSingletonAsync<CacheDatabase>(
        () async {
          final cacheDatabase = CacheDatabase();
          await cacheDatabase.initializeDatabase();
          return cacheDatabase;
        },
      );
  }
}
