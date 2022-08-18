import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'results')
  final List<Movie>? moviesList;
  @JsonKey(name: 'total_pages')
  final int? totalPage;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  const MovieResponse(
    this.page,
    this.moviesList,
    this.totalPage,
    this.totalResults,
  );

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  factory MovieResponse.empty() => const MovieResponse(null, null, null, null);
}

@JsonSerializable()
class Movie {
  @JsonKey(name: 'adult')
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'overview')
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(ignore: true)
  String get thumbnailMovieUrl {
    return 'https://image.tmdb.org/t/p/w185' + (posterPath ?? "");
  }

  @JsonKey(ignore: true)
  bool isLoadMoreItem;

  Movie({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.title,
    this.isLoadMoreItem = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  factory Movie.loadMoreItem() => Movie(isLoadMoreItem: true);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
