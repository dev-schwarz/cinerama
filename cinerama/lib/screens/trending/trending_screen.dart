import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../material.dart';
import '../../stores/results/trending_store.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen(this.store, {Key key}) : super(key: key);

  final TrendingStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Trending'),
      ),
      body: Observer(
        builder: (_) {
          if (!store.hasResults) {
            return const BigLoadingIndicator(
              iconData: Icons.trending_up,
              title: 'Loading',
              message: 'Trending',
            );
          } else {
            return ResultsView<Trending>(
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
