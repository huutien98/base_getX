class UrlEndPoint {
  static const login = '/login';

  static getListPopularMovie({required String apiKey, int page = 1}) =>
      '/discover/movie?api_key=$apiKey&page=$page';
  static getListTopRatedMovie({required String apiKey, int page = 1}) =>
      '/movie/top_rated?api_key=$apiKey&language=en-US&page=$page';
}
