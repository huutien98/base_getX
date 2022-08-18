import 'package:final_config_enviroment/model/http_raw/network_exception.dart';
import 'package:final_config_enviroment/model/movie_response/movie_response.dart';
import 'package:final_config_enviroment/repository/network_repository.dart';
import 'package:final_config_enviroment/repository/url_end_point.dart';
import 'package:final_config_enviroment/utils/const.dart';
import 'package:final_config_enviroment/utils/handle_call_api.dart';
import 'package:get/get.dart';

abstract class MovieRepository {
  Future<MovieResponse> getDiscoveryMovies({int page = 1});

  Future<MovieResponse> getTopRateMovies({int page = 1});
}

class MovieRepositoryImlp extends MovieRepository {
  final NetworkRepository _networkRepository = Get.find();

  @override
  Future<MovieResponse> getDiscoveryMovies({int page = 1}) async {
    MovieResponse? movieResponse;
    await callApi<MovieResponse>(
        methodCallApi: () => _networkRepository.get(
              endUrl: UrlEndPoint.getListPopularMovie(
                  apiKey: Const.movieApiKey, page: page),
            ),
        parsing: (Map<String, dynamic> data) => MovieResponse.fromJson(data),
        onSuccess: (MovieResponse response) {
          movieResponse = response;
        },
        onError: (NetworkException exp) {
          print('dongnd1 thow 1 exp');
          throw exp;
        });
    print('dongnd1 return discovery: $movieResponse');
    return movieResponse ?? MovieResponse.empty();
  }

  @override
  Future<MovieResponse> getTopRateMovies({int page = 1}) async {
    MovieResponse? movieResponse;
    await callApi<MovieResponse>(
        methodCallApi: () => _networkRepository.get(
              endUrl: UrlEndPoint.getListTopRatedMovie(
                  apiKey: Const.movieApiKey, page: page),
            ),
        parsing: (Map<String, dynamic> data) => MovieResponse.fromJson(data),
        onSuccess: (MovieResponse response) {
          movieResponse = response;
        },
        onError: (NetworkException exp) {
          print('dongnd1 thow 2 exp');
          throw exp;
        });

    print('dongnd1 return top rate: $movieResponse');
    return movieResponse ?? MovieResponse.empty();
  }
}
