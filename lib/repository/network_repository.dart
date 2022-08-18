import 'package:dio/dio.dart';
import 'package:final_config_enviroment/model/http_raw/http_raw.dart';
import 'package:final_config_enviroment/utils/const.dart';
import 'package:final_config_enviroment/utils/logger.dart';
import 'package:final_config_enviroment/utils/timestamp.dart';

abstract class NetworkRepository {
  Future<HttpRaw> get(
      {required String endUrl, Map<String, dynamic>? queryParameters});
}

class NetworkRepositoryImpl extends NetworkRepository {
  late Dio _dio;
  final String baseUrl;

  NetworkRepositoryImpl({required this.baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Const.timeoutRequestNetwork,
      receiveTimeout: Const.timeoutReviveResponseNetwork,
    ));

    _dio.interceptors.add(MyInterceptor());
  }

  @override
  Future<HttpRaw> get(
      {required String endUrl, Map<String, dynamic>? queryParameters}) async {
    final httpRawResponse = (await _fetch(
            () => _dio.get(endUrl, queryParameters: queryParameters))) ??
        const HttpRaw();
    return httpRawResponse;
  }

  Future<HttpRaw?> _fetch(Future<Response> Function() function) async {
    try {
      Response response = await function.call();
      if (response.statusCode == Const.successNetworkCall) {
        return HttpRaw(isSuccessCall: true, data: response.data);
      }
    } on DioError catch (dioError) {
      int errorCode = Const.dioErrorOther;
      switch (dioError.type) {
        case DioErrorType.connectTimeout:
          errorCode = Const.dioErrorConnectTimeout;
          break;
        case DioErrorType.sendTimeout:
          errorCode = Const.dioErrorSendTimeout;
          break;
        case DioErrorType.receiveTimeout:
          errorCode = Const.dioErrorReceiveTimeout;
          break;
        case DioErrorType.response:
          errorCode = Const.dioErrorResponse;
          break;
        case DioErrorType.cancel:
          errorCode = Const.dioErrorCancel;
          break;
        case DioErrorType.other:
          break;
      }
      return HttpRaw(
        isSuccessCall: false,
        errorMessage: '',
        errorCode: errorCode,
      );
    } catch (error) {
      return const HttpRaw(
          isSuccessCall: false, errorCode: Const.unknownErrorNetworkCall);
    }
    return null;
  }
}

class MyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Add header here
    logger.d(
        'Request API option: method: ${options.uri}, data: ${options.data}, ${Timestamp.getCurrentTimeStamp()}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
        'Request API response: statusCode: ${response.statusCode}, ${Timestamp.getCurrentTimeStamp()}');
    logger.d('Request API response: data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e(
        'Request API error: ${err.requestOptions.uri} ,${err.response?.statusCode} ${err.message},${Timestamp.getCurrentTimeStamp()}');
    super.onError(err, handler);
  }
}
