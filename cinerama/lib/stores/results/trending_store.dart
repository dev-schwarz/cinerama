import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import 'results_store.dart';

part 'trending_store.g.dart';

class TrendingStore = _TrendingStoreBase with _$TrendingStore;

abstract class _TrendingStoreBase extends ResultsStore<Trending> with Store {
  @override
  Future<Trending> fetchResultsInternal() {
    return tmdb.api.trending
        .getTrending(
          TTrendingMediaType.all,
          TTrendingTimeWindow.week,
          page: (results?.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        )
        .then((value) => value);
  }
}
