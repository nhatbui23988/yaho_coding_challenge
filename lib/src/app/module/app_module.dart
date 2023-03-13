

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yaho_coding_challenge/main.dart';
import 'package:yaho_coding_challenge/src/data/datasource/app_services.dart';
import 'package:yaho_coding_challenge/src/data/datasource/interceptor/logging.dart';
import 'package:yaho_coding_challenge/src/data/repository/user_repository.dart';


class AppModule{
  static void initModule(){
    final dio = _createDio();
    final appService = AppServices(dio);
    final userRepository = UserRepository(appService);
    // DI
    getIt.registerSingleton<AppServices>(appService);
    getIt.registerSingleton<UserRepository>(userRepository);
  }


  static Dio _createDio(){
    final dio = Dio();
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['content-type'] = 'application/json; charset=utf-8';
    final logApi = APILog();
    dio.interceptors.add(logApi);
    return dio;
  }
}


