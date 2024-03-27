import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:perm_game_app/core/app.dart';

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..connectionTimeout = const Duration(seconds: App.apiRequestTimeout)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // для вэба не поддерживается Platform, поэтому проверяем отдельно и сохраняем
        // поведение при проверке сертификата
        if (kIsWeb) {
          return false;
        }
        // для андроидов пропускаем проверку валидности сертификата в угоду поддержки
        // сертификатов let's encrypt на старых версиях андроид-телефонов
        // для iOS проверка валидности должна быть сохранена
        return Platform.isAndroid;
      };
  }
}
