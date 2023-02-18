import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maxway_branches/data/api.dart';

final di = GetIt.instance;

void setupDI() {
  di.registerLazySingleton(
    () => Api(
      Dio(
        BaseOptions(baseUrl: "https://maxway.uz/_next/data/"),
      ),
    ),
  );
}
