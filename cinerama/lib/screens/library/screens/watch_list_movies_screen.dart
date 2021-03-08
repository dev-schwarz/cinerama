import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../material.dart';
import '../widgets/library_app_bar_title.dart';

class WatchListMoviesScreen extends StatelessWidget {
  const WatchListMoviesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.dataStore.watchListStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppConstants.appAppBarTitleSpacing,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: context.i18n.screens.library.watchListMovies,
              listSize: store.hasWatchListMovies ? store.watchListMovies.totalResults : 0,
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
            // tooltip: context.i18n.tmdb.sortOrderSwitch(store.watchListMoviesSortBy.order),
            tooltip: 'Order',
            onPressed: store.toggleWatchListMoviesSortBy,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !store.hasWatchListMovies
              ? const BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsView<AccountWatchListMovies>(
                  content: store.watchListMovies,
                );
        },
      ),
    );
  }
}
