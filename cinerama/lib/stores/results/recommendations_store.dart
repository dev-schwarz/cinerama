import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import 'results_store.dart';

part 'recommendations_store.g.dart';

class RecommendationsMoviesStore = _RecommendationsMoviesStoreBase
    with _$RecommendationsMoviesStore;

abstract class _RecommendationsMoviesStoreBase extends ResultsStore<MovieRecommendations>
    with Store {
  _RecommendationsMoviesStoreBase() : super(autoFetch: false);

  @observable
  MovieRecommendationsSortBy sortBy;

  @action
  void setSortBy(MovieRecommendationsSortBy sortBy) => this.sortBy = sortBy;

  ReactionDisposer _reaction;

  void setupReactions() {
    _reaction = reaction((_) => sortBy, (_) => fetchResults());
  }

  void dispose() {
    if (_reaction != null) {
      _reaction();
    }
  }

  @override
  Future<MovieRecommendations> fetchResultsInternal() {
    return tmdb.api.account4
        .getMovieRecommendations(
          page: resultsNextPageIndex,
          language: TmdbConfig.language.language,
          sortBy: sortBy,
        )
        .then((value) => value);
  }
}

class RecommendationsTvsStore = _RecommendationsTvsStoreBase with _$RecommendationsTvsStore;

abstract class _RecommendationsTvsStoreBase extends ResultsStore<TvRecommendations> with Store {
  _RecommendationsTvsStoreBase() : super(autoFetch: false);

  @observable
  TvRecommendationsSortBy sortBy;

  @action
  void setSortBy(TvRecommendationsSortBy sortBy) => this.sortBy = sortBy;

  ReactionDisposer _reaction;

  void setupReactions() {
    _reaction = reaction((_) => sortBy, (_) => fetchResults());
  }

  void dispose() {
    if (_reaction != null) {
      _reaction();
    }
  }

  @override
  Future<TvRecommendations> fetchResultsInternal() {
    return tmdb.api.account4
        .getTvRecommendations(
          page: resultsNextPageIndex,
          language: TmdbConfig.language.language,
          sortBy: sortBy,
        )
        .then((value) => value);
  }
}
