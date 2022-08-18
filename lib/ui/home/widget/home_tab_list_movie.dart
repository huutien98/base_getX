import 'package:final_config_enviroment/model/enum/load_status.dart';
import 'package:final_config_enviroment/model/enum/movie_list_type.dart';
import 'package:final_config_enviroment/model/movie_response/movie_response.dart';
import 'package:final_config_enviroment/ui/home/widget/home_movie_list.dart';
import 'package:final_config_enviroment/ui/home/widget/home_movie_loading_list.dart';
import 'package:flutter/material.dart';

class HomeTabListMovie extends StatelessWidget {
  final MovieListType movieListType;
  final List<Movie> listMovies;
  final String title;
  final LoadStatus loadingStatus;
  final VoidCallback loadMoreCallBack;

  const HomeTabListMovie({
    Key? key,
    required this.movieListType,
    required this.listMovies,
    required this.title,
    required this.loadingStatus,
    required this.loadMoreCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(margin: const EdgeInsets.all(16), child: Text(title)),
        Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            height: 150,
            child: _buildBody())
      ],
    );
  }

  Widget _buildBody() {
    if (loadingStatus == LoadStatus.loading ||
        loadingStatus == LoadStatus.initial) {
      return const HomeLoadingMovieList();
    } else {
      return HomeMovieList(
        listMovies: listMovies,
        loadMoreCallback: () {
          loadMoreCallBack.call();
        },
        isLoadMore: loadingStatus == LoadStatus.loadMore,
      );
    }
  }
}
