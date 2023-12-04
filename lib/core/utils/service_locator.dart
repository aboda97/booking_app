import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  static void setupServiceLocator() {
    /// DIO
    sl.registerLazySingleton<Dio>(
      () => Dio(),
    );

    /// API SERVICE
    sl.registerLazySingleton<ApiServices>(
      () => ApiServices(
        sl(),
      ),
    );

    /// HOME REPO IMPLEMENTATION
    sl.registerLazySingleton<HomeRepoImplementation>(
      () => HomeRepoImplementation(
        sl(),
      ),
    );

    /// HOME REPO
    sl.registerLazySingleton<HomeRepo>(
      () => HomeRepoImplementation(
        sl(),
      ),
    );
  }
}
