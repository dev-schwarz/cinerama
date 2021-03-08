part of '../app_localizations.dart';

class _MovieDetailsScreen {
  const _MovieDetailsScreen();

  String get btnRecommendations => Intl.message(
        'Show recommendations based on this title',
        name: '_MovieDetailsScreen_btnRecommendations',
        desc: '[Screens][MovieDetailsScreen]',
      );

  String get genres => Intl.message(
        'Genres',
        name: '_MovieDetailsScreen_genres',
        desc: '[Screens][MovieDetailsScreen]',
      );

  String get status => Intl.message(
        'Status',
        name: '_MovieDetailsScreen_status',
        desc: '[Screens][MovieDetailsScreen]',
      );

  String get budget => Intl.message(
        'Budget',
        name: '_MovieDetailsScreen_budget',
        desc: '[Screens][MovieDetailsScreen]',
      );

  String get revenue => Intl.message(
        'Revenue',
        name: '_MovieDetailsScreen_revenue',
        desc: '[Screens][MovieDetailsScreen]',
      );

  String get cast => Intl.message(
        'Cast',
        name: '_MovieDetailsScreen_cast',
        desc: '[Screens][MovieDetailsScreen]',
      );

  String get crew => Intl.message(
        'Crew',
        name: '_MovieDetailsScreen_crew',
        desc: '[Screens][MovieDetailsScreen]',
      );
}
