import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/Search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiServices>(ApiServices(Dio()));

  getit.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(getit.get<ApiServices>()),
  );

  getit.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(getit.get<ApiServices>()),
  );
}

