import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import '../../models/tmdb_resumed_media.dart';
import 'results_store.dart';

part 'movie_recommendations_store.g.dart';

class MovieRecommendationsStore = _MovieRecommendationsStoreBase with _$MovieRecommendationsStore;

abstract class _MovieRecommendationsStoreBase extends ResultsStore<MovieRecommendations>
    with Store {
  _MovieRecommendationsStoreBase({@required this.resumedMedia});

  final TmdbResumedMedia resumedMedia;

  @override
  Future<MovieRecommendations> fetchResultsInternal() {
    return tmdb.api.movie
        .getRecommendations(
          resumedMedia.id,
          page: (results?.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        )
        .then((value) => value);
  }
}
