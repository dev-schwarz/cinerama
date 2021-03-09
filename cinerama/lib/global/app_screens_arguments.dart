import 'package:flutter/foundation.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../models/tmdb_resumed_media.dart';

@immutable
class TvSeasonScreenArgs {
  const TvSeasonScreenArgs({
    @required this.tv,
    @required this.seasonNumber,
  });

  final Tv tv;
  final int seasonNumber;
}

@immutable
class TvEpisodeScreenArgs {
  const TvEpisodeScreenArgs({
    @required this.tv,
    @required this.tvSeason,
    @required this.episodeNumber,
  });

  final Tv tv;
  final TvSeason tvSeason;
  final int episodeNumber;
}

@immutable
class RecommendationsScreenArgs {
  const RecommendationsScreenArgs({@required this.resumedMedia});

  final TmdbResumedMedia resumedMedia;
}
