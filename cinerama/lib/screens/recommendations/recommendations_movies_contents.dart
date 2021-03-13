import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../material.dart';
import '../../stores/results/recommendations_store.dart';

class RecommendationsMoviesContents extends StatefulWidget {
  const RecommendationsMoviesContents({Key key}) : super(key: key);

  @override
  _RecommendationsMoviesContentsState createState() => _RecommendationsMoviesContentsState();
}

class _RecommendationsMoviesContentsState extends State<RecommendationsMoviesContents>
    with AutomaticKeepAliveClientMixin<RecommendationsMoviesContents> {
  RecommendationsMoviesStore _store;

  @override
  void initState() {
    super.initState();

    _store = RecommendationsMoviesStore();
    _store.setupReactions();

    if (!_store.hasResults) {
      _store.fetchResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Observer(
      builder: (ctx) {
        if (!_store.hasResults) {
          return BigLoadingIndicator(
            iconData: Icons.local_movies,
            // TODO: Add localizations here!
            title: 'Movies',
            message: 'Loading',
          );
        }

        return ResultsView<MovieRecommendations>(
          content: _store.results,
          handleRefresh: _store.fetchResults,
          loadNextPage: _store.fetchResultsNextPage,
        );
      },
    );
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
