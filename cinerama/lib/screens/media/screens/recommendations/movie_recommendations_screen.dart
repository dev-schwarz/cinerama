import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../../material.dart';
import '../../../../stores/results/movie_recommendations_store.dart';

class MovieRecommendationsScreen extends StatelessWidget {
  const MovieRecommendationsScreen(this.store, {Key key}) : super(key: key);

  final MovieRecommendationsStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Add localizations here!
        title: Text('Movie Recommendations'),
      ),
      body: Observer(
        builder: (_) {
          if (!store.hasResults) {
            return BigLoadingIndicator(
              iconData: Icons.local_movies,
              // TODO: Add localizations here!
              title: 'Loading recommendations for:',
              message: store.resumedMedia.title ?? '',
              horizontal: false,
            );
          } else {
            return ResultsView<MovieRecommendations>(
              content: store.results,
              handleRefresh: store.fetchResults,
              loadNextPage: store.fetchResultsNextPage,
            );
          }
        },
      ),
    );
  }
}
