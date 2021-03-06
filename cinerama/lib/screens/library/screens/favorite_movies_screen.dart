import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../material.dart';
import '../widgets/library_app_bar_title.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.dataStore.favoritesStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppConstants.appAppBarTitleSpacing,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: context.i18n.screens.library.favoriteMovies,
              listSize: store.hasFavoriteMovies ? store.favoriteMovies.totalResults : 0,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.swap_vert,
              size: 20.0,
              color: Colors.yellowAccent,
            ),
            visualDensity: VisualDensity.compact,
            // tooltip: context.i18n.tmdb.sortOrderSwitch(store.favoriteMoviesSortBy.order),
            tooltip: 'Favorite',
            onPressed: store.toggleFavoriteMoviesSortBy,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !store.hasFavoriteMovies
              ? const BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsView<AccountFavoriteMovies>(
                  content: store.favoriteMovies,
                );
        },
      ),
    );
  }
}
