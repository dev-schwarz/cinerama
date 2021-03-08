part of '../app_localizations.dart';

class _LibraryScreen {
  const _LibraryScreen();

  String get favoriteMovies => Intl.message(
        'Favorite Movies',
        name: '_LibraryScreen_favoriteMovies',
        desc: '[Screens][LibraryScreen]',
      );

  String get favoriteTvs => Intl.message(
        'Favorite Tvs',
        name: '_LibraryScreen_favoriteTvs',
        desc: '[Screens][LibraryScreen]',
      );

  String get watchListMovies => Intl.message(
        'Movies to Watch',
        name: '_LibraryScreen_watchListMovies',
        desc: '[Screens][LibraryScreen]',
      );

  String get watchListTvs => Intl.message(
        'Tvs to Watch',
        name: '_LibraryScreen_watchListTvs',
        desc: '[Screens][LibraryScreen]',
      );

  String get myLists => Intl.message(
        'My Lists',
        name: '_LibraryScreen_myLists',
        desc: '[Screens][LibraryScreen]',
      );

  String get createdAt => Intl.message(
        'Created at',
        name: '_LibraryScreen_createdAt',
        desc: '[Screens][LibraryScreen]',
      );

  String get updatedAt => Intl.message(
        'Updated at',
        name: '_LibraryScreen_updatedAt',
        desc: '[Screens][LibraryScreen]',
      );
}
