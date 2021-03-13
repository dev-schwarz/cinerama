import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../material.dart';
import '../../stores/results/recommendations_store.dart';

class RecommendationsTvsContents extends StatefulWidget {
  const RecommendationsTvsContents({Key key}) : super(key: key);

  @override
  _RecommendationsTvsContentsState createState() => _RecommendationsTvsContentsState();
}

class _RecommendationsTvsContentsState extends State<RecommendationsTvsContents>
    with AutomaticKeepAliveClientMixin<RecommendationsTvsContents> {
  RecommendationsTvsStore _store;

  @override
  void initState() {
    super.initState();

    _store = RecommendationsTvsStore();
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
            iconData: Icons.live_tv,
            // TODO: Add localizations here!
            title: 'Tvs',
            message: 'Loading',
          );
        }

        return ResultsView<TvRecommendations>(
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
