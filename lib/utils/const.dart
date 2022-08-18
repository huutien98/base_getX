class Const {

  static const String baseUrlStg = "https://api.themoviedb.org/3";
  static const String baseUrlProduct = "https://api.themoviedb.org/3";
  static const String movieApiKey = "26763d7bf2e94098192e629eb975dab0";

  static const int numberMovieItemInOnePage = 20;

  static const int timeoutRequestNetwork = 20000;
  static const int timeoutReviveResponseNetwork = 10000;


  /// Code response API
  static const int successNetworkCall = 200;
  static const int unknownErrorNetworkCall = 999;

  static const int dioErrorConnectTimeout = 600;
  static const int dioErrorSendTimeout = 601;
  static const int dioErrorReceiveTimeout = 602;
  static const int dioErrorResponse = 603;
  static const int dioErrorCancel = 604;
  static const int dioErrorOther = 605;

  /// Parsing net  response error
  static const int parsingNetworkResponseError = 700;
}
