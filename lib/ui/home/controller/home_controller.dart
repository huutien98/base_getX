import 'package:final_config_enviroment/model/enum/home_menu_item.dart';
import 'package:final_config_enviroment/model/enum/load_status.dart';
import 'package:final_config_enviroment/model/movie_response/movie_response.dart';
import 'package:final_config_enviroment/repository/movie_repository.dart';
import 'package:final_config_enviroment/utils/handle_call_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// For top rated movie
  Rx<LoadStatus> loadingTopRatedStatus = LoadStatus.initial.obs;
  int totalTopRateMoviePage = 0;
  int nextPageTopRatedMovieLoading = 1;

  bool get canLoadMoreTopRatedMovie =>
      nextPageTopRatedMovieLoading < totalTopRateMoviePage;

  List<Movie> topRatedMoviesList = [];

  /// For discovery movie
  var loadingDiscoveryMovieStatus = LoadStatus.initial.obs;
  int totalDiscoveryMoviePage = 0;
  int nextPageDiscoveryMovieLoading = 1;

  bool get canLoadMoreDiscoveryMovie =>
      nextPageDiscoveryMovieLoading < totalDiscoveryMoviePage;
  List<Movie> discoveryMoviesList = [];

  final MovieRepository _movieRepository = Get.find();

  /// Home bottom menu
  var currentTab = HomeMenuItem.home.obs;

  void changeHomeMenuTab(int tabIndex) {
    HomeMenuItem newTab = HomeMenuItem.home;
    if (tabIndex == 0) {
      newTab = HomeMenuItem.home;
    } else if (tabIndex == 1) {
      newTab = HomeMenuItem.business;
    } else {
      newTab = HomeMenuItem.school;
    }
    currentTab.value = newTab;
  }

  void getDiscoveryMovieList({bool isLoadMore = false}) async {
    if (isLoadMore && !canLoadMoreDiscoveryMovie) {
      _removeLoadingMoreItemIfNeeded(discoveryMoviesList);
      return;
    }
    loadingDiscoveryMovieStatus.value =
        isLoadMore ? LoadStatus.loadMore : LoadStatus.loading;

    handleActionWithError(methodCallApi: () async {
      MovieResponse response = await _movieRepository.getDiscoveryMovies(
          page: nextPageDiscoveryMovieLoading);
      totalDiscoveryMoviePage = response.totalPage ?? 0;
      nextPageDiscoveryMovieLoading++;
      if (isLoadMore) {
        discoveryMoviesList.removeAt(discoveryMoviesList.length - 1);
        print('dongnd1 remove last');
      }
      try {
        discoveryMoviesList.addAll(response.moviesList?.toList() ?? []);
      } catch (e) {
        print('dongnd1 e: $e');
      }

      if (canLoadMoreDiscoveryMovie) {
        discoveryMoviesList.add(Movie.loadMoreItem());
        print('dongnd1 add more');
      }
      loadingDiscoveryMovieStatus.value = LoadStatus.success;
    }, onError: () {
      _removeLoadingMoreItemIfNeeded(discoveryMoviesList);
      loadingDiscoveryMovieStatus.value = LoadStatus.error;
    });
  }

  void getTopRatedMovieList({bool isLoadMore = false}) async {
    if (isLoadMore && !canLoadMoreTopRatedMovie){
      _removeLoadingMoreItemIfNeeded(topRatedMoviesList);
      return;
    }
    loadingTopRatedStatus.value =
        isLoadMore ? LoadStatus.loadMore : LoadStatus.loading;

    handleActionWithError(methodCallApi: () async {
      MovieResponse response = await _movieRepository.getTopRateMovies(
          page: nextPageTopRatedMovieLoading);
      totalTopRateMoviePage = response.totalPage ?? 0;
      nextPageTopRatedMovieLoading++;
      if (isLoadMore) {
        topRatedMoviesList.removeLast();
      }
      topRatedMoviesList.addAll(response.moviesList?.toList() ?? []);
      if (canLoadMoreTopRatedMovie) {
        topRatedMoviesList.add(Movie.loadMoreItem());
      }
      loadingTopRatedStatus.value = LoadStatus.success;
    }, onError: () {
      _removeLoadingMoreItemIfNeeded(topRatedMoviesList);
      loadingTopRatedStatus.value = LoadStatus.error;
    });
  }

  void _removeLoadingMoreItemIfNeeded(List<Movie> listMovies) {
    if(listMovies.isEmpty) return;

    if(listMovies.last.isLoadMoreItem) {
      listMovies.removeAt(listMovies.length - 1);
    }
  }
}
