import 'package:dio/dio.dart';
import 'package:perm_game_app/core/data/internet_connection_manager.dart';
import 'package:perm_game_app/core/utils/exceptions.dart';
/// Проверяет наличие интернет соединения
///
/// Если нет интернета, бросает [NoInternetConnectionException]
class CheckConnectionInterceptor extends Interceptor {
  CheckConnectionInterceptor(this._internetConnectionManager);

  /// Класс проверяющий интернет соединение
  final InternetConnectionManager _internetConnectionManager;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (await _internetConnectionManager.isNoConnection) {
      handler.reject(DioException(requestOptions: options, error: NoInternetException()));
    } else {
      return handler.next(options);
    }
    
  }
}
