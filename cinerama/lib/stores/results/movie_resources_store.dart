import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import '../../models/tmdb_resumed_media.dart';
import 'media_resources_store.dart';

part 'movie_resources_store.g.dart';

class MovieRecommendationsResourceStore = _MovieRecommendationsResourceStoreBase
    with _$MovieRecommendationsResourceStore;

abstract class _MovieRecommendationsResourceStoreBase
    extends MediaResourcesStore<MovieRecommendations> with Store {
  _MovieRecommendationsResourceStoreBase({
    @required this.resumedMedia,
  }) : super(resumedMedia);

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

class MovieSimilarResourceStore = _MovieSimilarResourceStoreBase with _$MovieSimilarResourceStore;

abstract class _MovieSimilarResourceStoreBase extends MediaResourcesStore<SimilarMovies>
    with Store {
  _MovieSimilarResourceStoreBase({
    @required TmdbResumedMedia resumedMedia,
  }) : super(resumedMedia);

  @override
  Future<SimilarMovies> fetchResultsInternal() {
    return tmdb.api.movie
        .getSimilarMovies(
          resumedMedia.id,
          page: resultsNextPageIndex,
          language: TmdbConfig.language.language,
        )
        .then((value) => value);
  }
}
