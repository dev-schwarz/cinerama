import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../global/navigation/app_navigation.dart';
import '../material.dart';
import '../screens/drawer_screens/about/about_screen.dart';
import '../screens/drawer_screens/settings/settings_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/initial/initial_screen.dart';
import '../screens/library/screens/favorite_movies_screen.dart';
import '../screens/library/screens/favorite_tvs_screen.dart';
import '../screens/library/screens/user_list_screen.dart';
import '../screens/library/screens/watch_list_movies_screen.dart';
import '../screens/library/screens/watch_list_tvs_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/tmdb_access/tmdb_access_module.dart';
import '../screens/media/screens/movie_screen.dart';
import '../screens/media/screens/person_screen.dart';
import '../screens/media/screens/recommendations/movie_recommendations_screen.dart';
import '../screens/media/screens/recommendations/tv_recommendations_screen.dart';
import '../screens/media/screens/tv_episode_screen.dart';
import '../screens/media/screens/tv_screen.dart';
import '../screens/media/screens/tv_season_screen.dart';
import '../screens/search/search_screen.dart';
import '../services/prefs_service.dart';
import '../services/tmdb_service.dart';
import '../stores/controllers/home_screen_controller.dart';
import '../stores/login/login_store.dart';
import '../stores/media/media_store.dart';
import '../stores/results/movie_resources_store.dart';
import '../stores/results/tv_resources_store.dart';
import '../stores/settings_store.dart';
import '../stores/user_data/user_data_store.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TmdbService.init(_TmdbApiInitializer._initApi())),
        Bind((i) => PrefsService()),
        Bind((i) => SettingsStore(), lazy: false),
        Bind((i) => LoginStore(clearUserData: false)),
        Bind((i) => UserDataStore()),
        Bind((i) => HomeScreenController()),
        // Bind((i) => Reco2ScreenController()),
      ];

  @override
  Widget get bootstrap => const AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AppRoutes.initial, child: (_, __) => const InitialScreen()),
        ModularRouter(AppRoutes.login, child: (_, __) => const LoginScreen()),
        ModularRouter(AppRoutes.tmdbAccess, module: TmdbAccessModule()),
        ModularRouter(AppRoutes.home, child: (_, __) => const HomeScreen()),
        ModularRouter(AppRoutes.search, child: (_, __) => const SearchScreen()),
        ModularRouter(AppRoutes.appAbout, child: (_, __) => const AboutScreen()),
        ModularRouter(AppRoutes.appSettings, child: (_, __) => const SettingsScreen()),
        ModularRouter(
          AppRoutes.libraryFavoriteMovies,
          child: (_, __) => const FavoriteMoviesScreen(),
        ),
        ModularRouter(
          AppRoutes.libraryFavoriteTvs,
          child: (_, __) => const FavoriteTvsScreen(),
        ),
        ModularRouter(
          AppRoutes.libraryWatchListMovies,
          child: (_, __) => const WatchListMoviesScreen(),
        ),
        ModularRouter(
          AppRoutes.libraryWatchListTvs,
          child: (_, __) => const WatchListTvsScreen(),
        ),
        ModularRouter(
          AppRoutes.libraryUserList,
          child: (_, args) => UserListScreen(args.data),
        ),
        ModularRouter(
          AppRoutes.movieDetails,
          child: (_, args) => MovieScreen(MovieStore(id: args.data)),
        ),
        ModularRouter(
          AppRoutes.personDetails,
          child: (_, args) => PersonScreen(PersonStore(id: args.data)),
        ),
        ModularRouter(
          AppRoutes.tvDetails,
          child: (_, args) => TvScreen(TvStore(id: args.data)),
        ),
        ModularRouter(
          AppRoutes.tvSeasonDetails,
          child: (_, args) {
            final TvSeasonScreenArgs data = args.data;
            return TvSeasonScreen(
              TvSeasonStore(
                tv: data.tv,
                seasonNumber: data.seasonNumber,
              ),
            );
          },
        ),
        ModularRouter(AppRoutes.tvEpisodeDetails, child: (_, args) {
          final TvEpisodeScreenArgs data = args.data;
          return TvEpisodeScreen(
            TvEpisodeStore(
              tv: data.tv,
              tvSeason: data.tvSeason,
              episodeNumber: data.episodeNumber,
            ),
          );
        }),
        ModularRouter(AppRoutes.movieRecommendations, child: (_, args) {
          final RecommendationsScreenArgs data = args.data;
          return MovieRecommendationsScreen(
            MovieRecommendationsResourceStore(
              resumedMedia: data.resumedMedia,
            ),
          );
        }),
        ModularRouter(AppRoutes.tvRecommendations, child: (_, args) {
          final RecommendationsScreenArgs data = args.data;
          return TvRecommendationsScreen(
            TvRecommendationsResourceStore(
              resumedMedia: data.resumedMedia,
            ),
          );
        }),
      ];
}

class _TmdbApiInitializer {
  const _TmdbApiInitializer._();

  static TmdbRepository _initApi() {
    return TmdbRepository(_apiKey, _readAccessToken);
  }

  static const _apiKey = r'''ffea4ca1099c6f945cfe912e08056be2''';
  static const _readAccessToken =
      r'''eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1N'''
      r'''mJlMiIsInN1YiI6IjVkM2ZhNWU5MzRlMTUyMWZiOGU3OWQ1MSIsInNjb3BlcyI6WyJhcGl'''
      r'''fcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qLAhUehikWiZ8Oj8bHNZN5PSL2irXz-5mtcok9_NBtg''';
}
