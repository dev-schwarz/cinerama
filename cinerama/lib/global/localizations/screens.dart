part of 'app_localizations.dart';

class _Screens {
  const _Screens();

  _ScreensTitles get titles => const _ScreensTitles();

  _SettingsScreen get settingsScreen => const _SettingsScreen();

  _DiscoverMoviesScreen get discoverMoviesScreen => const _DiscoverMoviesScreen();

  _Search get search => const _Search();
}

class _ScreensTitles {
  const _ScreensTitles();

  String get trending => Intl.message(
        'Trending',
        name: '_ScreensTitles_trending',
        desc: '[Screens]',
      );

  String get discover => Intl.message(
        'Discover',
        name: '_ScreensTitles_discover',
        desc: '[Screens]',
      );

  String get assignments => Intl.message(
        'Assignments',
        name: '_ScreensTitles_assignments',
        desc: '[Screens]',
      );

  String get library => Intl.message(
        'Library',
        name: '_ScreensTitles_library',
        desc: '[Screens]',
      );

  String get settings => Intl.message(
        'Settings',
        name: '_ScreensTitles_settings',
        desc: '[Screens]',
      );

  String get settingsLanguages => Intl.message(
        'Select a Language',
        name: '_ScreensTitles_settingsLanguages',
        desc: '[Screens]',
      );

  String get settingsRegions => Intl.message(
        'Select a Region',
        name: '_ScreensTitles_settingsRegions',
        desc: '[Screens]',
      );

  String get about => Intl.message(
        'About',
        name: '_ScreensTitles_about',
        desc: '[Screens]',
      );
}

class _SettingsScreen {
  const _SettingsScreen();

  String get includeAdult => Intl.message(
        'Include adult',
        name: '_SettingsScreen_includeAdult',
        desc: '[Screens][SettingsScreen]',
      );

  String get imageHighQuality => Intl.message(
        'Image high quality',
        name: '_SettingsScreen_imageHighQuality',
        desc: '[Screens][SettingsScreen]',
      );

  String get viewMode => Intl.message(
        'View mode',
        name: '_SettingsScreen_viewMode',
        desc: '[Screens][SettingsScreen]',
      );

  String get list => Intl.message(
        'List',
        name: '_SettingsScreen_list',
        desc: '[Screens][SettingsScreen]',
      );

  String get grid => Intl.message(
        'Grid',
        name: '_SettingsScreen_grid',
        desc: '[Screens][SettingsScreen]',
      );

  String get language => Intl.message(
        'Language',
        name: '_SettingsScreen_language',
        desc: '[Screens][SettingsScreen]',
      );

  String get region => Intl.message(
        'Region',
        name: '_SettingsScreen_region',
        desc: '[Screens][SettingsScreen]',
      );
}

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

class _Search {
  const _Search();

  String get title => Intl.message(
        'Search',
        name: '_Search_title',
        desc: '[Screens][Search]',
      );

  String get noResults => Intl.message(
        'No results found',
        name: '_Search_noResults',
        desc: '[Screens][Search]',
      );

  String get btnClear => Intl.message(
        'Clear',
        name: '_Search_btnClear',
        desc: '[Screens][Search]',
      );

  String get searching => Intl.message(
        'Searching',
        name: '_Search_searching',
        desc: '[Screens][Search]',
      );
  String get unknownMediaType => Intl.message(
        'Unknown media type',
        name: '_Search_unknownMediaType',
        desc: '[Screens][Search]',
      );
}
