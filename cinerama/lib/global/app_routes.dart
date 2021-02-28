class AppRoutes {
  const AppRoutes._();

  static const String initial = '/';
  static const String login = '/login';
  static const String tmdbAccess = '/tmdb-access';

  static const String home = '/home';
  static const String homeTrending = '/home-trending';
  static const String homeDiscover = '/home-discover';
  static const String homeAssignments = '/home-assignments';
  static const String homeLibrary = '/home-library';

  static const String search = '/search';

  static const String movieDetails = '/movie-details';
  static const String tvDetails = '/tv-details';
  static const String tvSeasonDetails = '/tv-season-details';
  static const String tvEpisodeDetails = '/tv-episode-details';
  static const String personDetails = '/person-details';
  static const String movieRecommendations = '/movie-recommendations';
  static const String tvRecommendations = '/tv-recommendations';

  static const String libraryFavoriteMovies = '/library-favorite-movies';
  static const String libraryFavoriteTvs = '/library-favorite-tvs';
  static const String libraryWatchListMovies = '/library-watch-list-movies';
  static const String libraryWatchListTvs = '/library-watch-list-tvs';
  static const String libraryUserList = '/library-user-list';

  static const String appSettings = '/app-settings';
  static const String appAbout = '/app-about';
}

class AppLoginRoutes {
  const AppLoginRoutes._();

  static const String loginHome = '/';
  static const String loginWelcome = '/login-welcome';
  static const String loginRequestPerm = '/login-request-permission';
  static const String loginPermGranted = '/login-permission-granted';
  static const String loginCompleted = '/login-completed';
}
