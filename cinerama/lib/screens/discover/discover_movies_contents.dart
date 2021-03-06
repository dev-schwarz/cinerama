import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../material.dart';
import '../../stores/results/discover_movies_store.dart';

class DiscoverMoviesContents extends StatelessWidget {
  const DiscoverMoviesContents(this.store, {Key key}) : super(key: key);

  final DiscoverMoviesStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!store.hasResults) {
          return BigLoadingIndicator(
            iconData: Icons.new_releases,
            title: context.i18n.screens.discoverMovies.pageTitle,
            message: 'Loading...',
          );
        }

        return ResultsView<DiscoverMovie>(
          content: store.results,
          handleRefresh: store.fetchResults,
          loadNextPage: store.fetchResultsNextPage,
        );
      },
    );
  }
}
