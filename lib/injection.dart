import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mynewapiapp/cubit/api_cubit.dart';

// import 'cubit/my_new_cubit_cubit.dart';
import 'my_repo.dart';
import 'web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<ApiCubit>(() => ApiCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = 20 * 1000
    ..options.receiveTimeout = 20 * 1000;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));
  return dio;
}
