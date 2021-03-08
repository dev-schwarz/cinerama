part of '../app_localizations.dart';

class _DiscoverMoviesScreen {
  const _DiscoverMoviesScreen();

  String get pageTitle => Intl.message(
        'Discover Movies',
        name: '_DiscoverMoviesScreen_pageTitle',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String get setupTitle => Intl.message(
        'Discover Movies Setup',
        name: '_DiscoverMoviesScreen_setupTitle',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String get setupButton => Intl.message(
        'Setup Filters',
        name: '_DiscoverMoviesScreen_setupButton',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String get closeButton => Intl.message(
        'Close',
        name: '_DiscoverMoviesScreen_closeButton',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String get applyButton => Intl.message(
        'Apply',
        name: '_DiscoverMoviesScreen_applyButton',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String _sortText(String sortText) => Intl.select(
        sortText,
        {
          'popularity': 'Popularity',
          'original_title': 'Original title',
          'release_date': 'Release date',
          'vote_average': 'Vote average',
          'vote_count': 'Vote count',
          'revenue': 'Revenue',
        },
        name: '_DiscoverMoviesScreen__sortText',
        desc: '[Screens][DiscoverMoviesScreen]',
        args: [sortText],
      );

  String sortText(DiscoverMovieSortBy sortBy) {
    return _sortText(sortBy.prefixString);
  }

  String orderText(SortOrder order) => Intl.select(
        order,
        {
          SortOrder.asc: 'Ascending order',
          SortOrder.desc: 'Descending order',
        },
        name: '_DiscoverMoviesScreen_orderText',
        desc: '[Screens][DiscoverMoviesScreen]',
        args: [order],
      );

  String get year => Intl.message(
        'Year',
        name: '_DiscoverMoviesScreen_year',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String get ofRelease => Intl.message(
        'of release',
        name: '_DiscoverMoviesScreen_ofRelease',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String get yearOfReleaseHint => Intl.message(
        'Sample: 2004',
        name: '_DiscoverMoviesScreen_yearOfReleaseHint',
        desc: '[Screens][DiscoverMoviesScreen]',
      );

  String get yearOfReleaseError => Intl.message(
        'Invalid year',
        name: '_DiscoverMoviesScreen_yearOfReleaseError',
        desc: '[Screens][DiscoverMoviesScreen]',
      );
}
