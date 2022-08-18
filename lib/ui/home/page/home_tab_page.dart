import 'package:final_config_enviroment/model/enum/load_status.dart';
import 'package:final_config_enviroment/model/enum/movie_list_type.dart';
import 'package:final_config_enviroment/ui/home/controller/home_controller.dart';
import 'package:final_config_enviroment/ui/home/widget/home_tab_list_movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    if (_homeController.loadingTopRatedStatus.value != LoadStatus.success) {
      _homeController.getTopRatedMovieList();
    }

    if (_homeController.loadingDiscoveryMovieStatus.value !=
        LoadStatus.success) {
      print('dongnd1 get discovery list');
      _homeController.getDiscoveryMovieList();
    }

    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Obx(
              () {
                print('dongnd1 disovery status loading: ${_homeController.loadingDiscoveryMovieStatus.value}');
                return HomeTabListMovie(
                  listMovies: _homeController.discoveryMoviesList,
                  movieListType: MovieListType.discovery,
                  title: 'Discovery',
                  loadingStatus: _homeController.loadingDiscoveryMovieStatus.value,
                  loadMoreCallBack: () {
                    if (_homeController.loadingDiscoveryMovieStatus.value ==
                        LoadStatus.loadMore) {
                      return;
                    }
                    _homeController.getDiscoveryMovieList(isLoadMore: true);
                  },
                );
              },
            ),
            Obx(
              () {
                print('dongnd1, topRated status: ${_homeController.loadingTopRatedStatus.value}');
                return HomeTabListMovie(
                  listMovies: _homeController.topRatedMoviesList,
                  movieListType: MovieListType.topRated,
                  title: 'Top Rated',
                  loadingStatus: _homeController.loadingTopRatedStatus.value,
                  loadMoreCallBack: () {
                    if (_homeController.loadingTopRatedStatus.value ==
                        LoadStatus.loadMore) {
                      return;
                    }
                    _homeController.getTopRatedMovieList(isLoadMore: true);
                  },
                );
              },
            ),
          ],
        ));
  }
}
