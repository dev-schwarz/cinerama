import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../../material.dart';
import '../../../../stores/results/tv_recommendations_store.dart';

class TvRecommendationsScreen extends StatelessWidget {
  const TvRecommendationsScreen(this.store, {Key key}) : super(key: key);

  final TvRecommendationsStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Add localizations here!
        title: Text('Tv Recommendations'),
      ),
      body: Observer(
        builder: (_) {
          if (!store.hasResults) {
            return BigLoadingIndicator(
              iconData: Icons.live_tv,
              // TODO: Add localizations here!
              title: 'Loading recommendations for:',
              message: store.resumedMedia.title ?? '',
              horizontal: false,
            );
          } else {
            return ResultsView<TvRecommendations>(
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
