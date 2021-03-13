import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import '../../models/tmdb_resumed_media.dart';
import 'results_store.dart';

part 'movie_resources_store.g.dart';

class MovieRecommendationsResourceStore = _MovieRecommendationsResourceStoreBase
    with _$MovieRecommendationsResourceStore;

abstract class _MovieRecommendationsResourceStoreBase extends ResultsStore<MovieRecommendations>
    with Store {
  _MovieRecommendationsResourceStoreBase({@required this.resumedMedia});

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
