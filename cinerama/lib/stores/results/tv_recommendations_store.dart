import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import '../../models/tmdb_resumed_media.dart';
import 'results_store.dart';

part 'tv_recommendations_store.g.dart';

class TvRecommendationsStore = TvRecommendationsStoreBase with _$TvRecommendationsStore;

abstract class TvRecommendationsStoreBase extends ResultsStore<TvRecommendations> with Store {
  TvRecommendationsStoreBase({@required this.resumedMedia});

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
