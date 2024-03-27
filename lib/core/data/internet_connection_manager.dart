import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Класс для проверки наличия интернет соединения
class InternetConnectionManager {
  /// Проверить наличие соединения
  Future<bool> get isConnection async {
    return !(await isNoConnection);
  }

  Future<bool> get isNoConnection async => (await Connectivity().checkConnectivity()) == ConnectivityResult.none;
}
