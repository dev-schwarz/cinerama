part of 'app_navigation.dart';

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
class MediaResourcesScreenArgs {
  const MediaResourcesScreenArgs({@required this.resumedMedia});

  final TmdbResumedMedia resumedMedia;
}
