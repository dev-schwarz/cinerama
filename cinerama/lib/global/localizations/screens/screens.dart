part of '../app_localizations.dart';

class _Screens {
  const _Screens();

  _ScreensTitles get titles => const _ScreensTitles();

  _LibraryScreen get library => const _LibraryScreen();

  _SettingsScreen get settings => const _SettingsScreen();

  _DiscoverMoviesScreen get discoverMovies => const _DiscoverMoviesScreen();

  _SearchScreen get search => const _SearchScreen();

  _MovieDetailsScreen get movieDetails => const _MovieDetailsScreen();

  _PersonDetailsScreen get personDetails => const _PersonDetailsScreen();

  _TvDetailsScreen get tvDetails => const _TvDetailsScreen();
}

class _ScreensTitles {
  const _ScreensTitles();

  String get trending => Intl.message(
        'Trending',
        name: '_ScreensTitles_trending',
        desc: '[Screens][ScreensTitles]',
      );

  String get discover => Intl.message(
        'Discover',
        name: '_ScreensTitles_discover',
        desc: '[Screens][ScreensTitles]',
      );

  String get assignments => Intl.message(
        'Assignments',
        name: '_ScreensTitles_assignments',
        desc: '[Screens][ScreensTitles]',
      );

  String get library => Intl.message(
        'Library',
        name: '_ScreensTitles_library',
        desc: '[Screens][ScreensTitles]',
      );

  String get settings => Intl.message(
        'Settings',
        name: '_ScreensTitles_settings',
        desc: '[Screens][ScreensTitles]',
      );

  String get settingsLanguages => Intl.message(
        'Select a Language',
        name: '_ScreensTitles_settingsLanguages',
        desc: '[Screens][ScreensTitles]',
      );

  String get settingsRegions => Intl.message(
        'Select a Region',
        name: '_ScreensTitles_settingsRegions',
        desc: '[Screens][ScreensTitles]',
      );

  String get about => Intl.message(
        'About',
        name: '_ScreensTitles_about',
        desc: '[Screens][ScreensTitles]',
      );
}
