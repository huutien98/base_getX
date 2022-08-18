import 'package:final_config_enviroment/model/http_raw/http_raw.dart';
import 'package:final_config_enviroment/model/http_raw/network_exception.dart';
import 'package:final_config_enviroment/model/login_response/login_response.dart';
import 'package:final_config_enviroment/repository/network_repository.dart';
import 'package:final_config_enviroment/utils/handle_call_api.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({
    required String userName,
    required String passWord,
  });

  Future<bool> isLoggedIn();

  void saveToken({required String token, required String accessToken});

  void removeToken();

  bool singOut();
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkRepository _networkRepository = Get.find();

  @override
  Future<LoginResponse> login(
      {required String userName, required String passWord}) async {
    await Future.delayed(const Duration(seconds: 2));
    return const LoginResponse('accessToken', 'refreshToken');
    LoginResponse? loginResponse;
    await callApi<LoginResponse>(
        methodCallApi: () => fakeLogin(),
        parsing: (Map<String, dynamic> data) => LoginResponse.fromJson(data),
        onSuccess: (LoginResponse response) {
          loginResponse = response;
        },
        onError: (NetworkException exp) {
          throw exp;
        });

    return loginResponse ?? LoginResponse.empty();
  }

  /// Fake login
  Future<HttpRaw> fakeLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    return const HttpRaw(
      isSuccessCall: true,
      data: '''
      {
        "accessToken": "accessToken",
        "refreshToken": "refreshToken"
      }
      ''',
    );
  }

  @override
  void removeToken() {}

  @override
  void saveToken({required String token, required String accessToken}) {}

  @override
  bool singOut() {
    return true;
  }

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }
}
