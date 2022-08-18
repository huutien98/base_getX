import 'package:final_config_enviroment/global/view/cache_thumbnail_movie.dart';
import 'package:final_config_enviroment/model/movie_response/movie_response.dart';
import 'package:flutter/material.dart';

class HomeMovieList extends StatelessWidget {
  final List<Movie> listMovies;
  final ScrollController _listMovieScrollController = ScrollController();
  final VoidCallback loadMoreCallback;
  final bool isLoadMore;

  HomeMovieList({
    Key? key,
    required this.listMovies,
    required this.loadMoreCallback,
    this.isLoadMore = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _setupListMovieController();
    print('dongnd1 listsize: ${listMovies.length}');
    return ListView.separated(
      primary: false,
      itemBuilder: (context, index) {
        if (listMovies[index].isLoadMoreItem) {
          return _buildLoadMoreItem();
        } else {
          return _buildMovieItem(listMovies[index]);
        }
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 150,
          width: 8,
        );
      },
      controller: _listMovieScrollController,
      itemCount: listMovies.length,
      scrollDirection: Axis.horizontal,
    );
  }

  void _setupListMovieController() {
    _listMovieScrollController.addListener(() {
      if (_listMovieScrollController.position.extentAfter <= 0) {
        print('dongnd1 call');
        loadMoreCallback.call();
      }
    });
  }

  Widget _buildLoadMoreItem() {
    return Container(
      width: 100,
      height: 250,
      child: Center(
        child: Transform.scale(
          scale: 0.7,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildMovieItem(Movie movie) {
    return Container(
      width: 100,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: CacheThumbnailMovie(
                  urlImage: movie.thumbnailMovieUrl,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text(movie.title ?? ''),
              ))
        ],
      ),
    );
  }
}
