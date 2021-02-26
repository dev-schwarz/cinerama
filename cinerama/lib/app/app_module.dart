import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../global/app_routes.dart';
import '../material.dart';
import '../screens/home/home_screen.dart';
import '../screens/initial/initial_screen.dart';
import '../screens/library/screens/favorite_movies_screen.dart';
import '../screens/library/screens/favorite_tvs_screen.dart';
import '../screens/library/screens/user_list_screen.dart';
import '../screens/library/screens/watch_list_movies_screen.dart';
import '../screens/library/screens/watch_list_tvs_screen.dart';
import '../screens/login/login_module.dart';
import '../screens/media/screens/movie_screen.dart';
import '../services/prefs_service.dart';
import '../services/tmdb_service.dart';
import '../stores/controllers/home_screen_controller.dart';
import '../stores/login/login_store.dart';
import '../stores/media/media_store.dart';
import '../stores/user_data/user_data_store.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TmdbService.init(_TmdbApiInitializer._initApi())),
        Bind((i) => PrefsService()),
        Bind((i) => LoginStore(clearUserData: false)),
        Bind((i) => UserDataStore()),
        Bind((i) => HomeScreenController()),
      ];

  @override
  Widget get bootstrap => const AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AppRoutes.initial, child: (_, __) => const InitialScreen()),
        ModularRouter(AppRoutes.login, module: LoginModule()),
        ModularRouter(AppRoutes.home, child: (_, __) => const HomeScreen()),
        ModularRouter(AppRoutes.search, child: (_, __) => null),
        ModularRouter(AppRoutes.appAbout, child: (_, __) => null),
        ModularRouter(AppRoutes.appSettings, child: (_, __) => null),
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
        ModularRouter(AppRoutes.personDetails, child: (_, __) => null),
        ModularRouter(AppRoutes.tvDetails, child: (_, __) => null),
        ModularRouter(AppRoutes.tvSeasonDetails, child: (_, __) => null),
        ModularRouter(AppRoutes.tvEpisodeDetails, child: (_, __) => null),
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