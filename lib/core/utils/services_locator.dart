import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(ApiServices(Dio())),
  );
  getit.registerSingleton(ApiServices(Dio()));
}
