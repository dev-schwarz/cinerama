part of '../app_localizations.dart';

class _TvDetailsScreen {
  const _TvDetailsScreen();

  String get seasons => Intl.message(
        'Seasons',
        name: '_TvDetailsScreen_seasons',
        desc: '[Screens][TvDetailsScreen]',
      );

  String get episodes => Intl.message(
        'Episodes',
        name: '_TvDetailsScreen_episodes',
        desc: '[Screens][TvDetailsScreen]',
      );

  String get btnRecommendations => Intl.message(
        'Show recommendations based on this title',
        name: '_TvDetailsScreen_btnRecommendations',
        desc: '[Screens][TvDetailsScreen]',
      );

  String get status => Intl.message(
        'Status',
        name: '_TvDetailsScreen_status',
        desc: '[Screens][TvDetailsScreen]',
      );

  String get inProduction => Intl.message(
        'In Production',
        name: '_TvDetailsScreen_inProduction',
        desc: '[Screens][TvDetailsScreen]',
      );

  String get createdBy => Intl.message(
        'Created By',
        name: '_TvDetailsScreen_createdBy',
        desc: '[Screens][TvDetailsScreen]',
      );

  String get cast => Intl.message(
        'Cast',
        name: '_TvDetailsScreen_cast',
        desc: '[Screens][TvDetailsScreen]',
      );

  String get crew => Intl.message(
        'Crew',
        name: '_TvDetailsScreen_crew',
        desc: '[Screens][TvDetailsScreen]',
      );
}

class _TvSeasonDetailsScreen {
  const _TvSeasonDetailsScreen();

  String get episodes => Intl.message(
        'episodes',
        name: '_TvSeasonDetailsScreen_episodes',
        desc: '[Screens][TvSeasonDetailsScreen]',
      );

  String get season => Intl.message(
        'Season',
        name: '_TvSeasonDetailsScreen_season',
        desc: '[Screens][TvSeasonDetailsScreen]',
      );
}

class _TvEpisodeDetailsScreen {
  const _TvEpisodeDetailsScreen();

  String get guestStars => Intl.message(
        'Guest Stars',
        name: '_TvEpisodeDetailsScreen_guestStars',
        desc: '[Screens][TvEpisodeDetailsScreen]',
      );

  String get season => Intl.message(
        'Season',
        name: '_TvEpisodeDetailsScreen_season',
        desc: '[Screens][TvEpisodeDetailsScreen]',
      );

  String get episode => Intl.message(
        'Episode',
        name: '_TvEpisodeDetailsScreen_episode',
        desc: '[Screens][TvEpisodeDetailsScreen]',
      );
}
