import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import '../../models/tmdb_resumed_media.dart';
import 'results_store.dart';

part 'tv_resources_store.g.dart';

class TvRecommendationsResourceStore = _TvRecommendationsResourceStoreBase
    with _$TvRecommendationsResourceStore;

abstract class _TvRecommendationsResourceStoreBase extends ResultsStore<TvRecommendations>
    with Store {
  _TvRecommendationsResourceStoreBase({@required this.resumedMedia});

  final TmdbResumedMedia resumedMedia;

  @override
  Future<TvRecommendations> fetchResultsInternal() {
    return tmdb.api.tv
        .getRecommendations(
          resumedMedia.id,
          page: (results?.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        )
        .then((value) => value);
  }
}
