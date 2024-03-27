import 'package:dio/dio.dart';
import 'package:perm_game_app/core/app.dart';
import 'package:perm_game_app/core/data/interceptors/check_connection_interceptor.dart';
import 'package:perm_game_app/core/data/internet_connection_manager.dart';

abstract class DioFactory{
  Dio create();
}

class DioFactoryImpl implements DioFactory{
  final InternetConnectionManager _internetConnectionManager;
  DioFactoryImpl(this._internetConnectionManager);
  @override
  Dio create() {
    final options = _createOptions();
    final dio = Dio(options);
    final interceptors = _createInterceptors();
    for (var i in interceptors) {
      dio.interceptors.add(i);
    }
    dio.options.headers["Access-Control-Allow-Origin"] = "*";
    dio.options.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS";
    dio.options.headers["Access-Control-Allow-Headers"] = "Origin, Content-Type, Accept";
    return dio;
  }

  /// Возвращает основную конфигурацию для объекта Dio
  BaseOptions _createOptions() {
    return BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: const Duration(seconds: App.apiRequestTimeout),
      contentType: 'application/json',
    );
  }

  /// Возврашает список Dio интерсепторов
  List<Interceptor> _createInterceptors() => [
        CheckConnectionInterceptor(_internetConnectionManager),
      ];

}