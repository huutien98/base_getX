import 'dart:convert';

import 'package:final_config_enviroment/model/http_raw/http_raw.dart';
import 'package:final_config_enviroment/model/http_raw/network_exception.dart';
import 'package:final_config_enviroment/utils/const.dart';

Future<void> handleActionWithError({
  required Future<void> Function() methodCallApi,
  Function? onError,
  Function? onSuccess,
}) async {
  try {
    final result = await methodCallApi.call();
  } catch (exception) {
    onError?.call();
  }
}

Future<void> callApi<T>({
  required Future<HttpRaw> Function() methodCallApi,
  required T Function(Map<String, dynamic>) parsing,
  required Function(T) onSuccess,
  Function(NetworkException)? onError,
}) async {
  final HttpRaw result = await methodCallApi.call();
  if (result.isSuccessCall ?? false) {
    try {
      onSuccess.call(parsing.call(result.data));
    } catch (e) {
      print('dongnd1: passing: ${e}');
      onError?.call(const NetworkException(
        code: Const.parsingNetworkResponseError,
        message: 'Parsing network response error',
      ));
    }
  } else {
    onError?.call(NetworkException.copyFromHttpRaw(result));
  }
}
