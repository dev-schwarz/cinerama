part of '../app_localizations.dart';

class _SearchScreen {
  const _SearchScreen();

  String get title => Intl.message(
        'Search',
        name: '_SearchScreen_title',
        desc: '[Screens][SearchScreen]',
      );

  String get noResults => Intl.message(
        'No results found',
        name: '_SearchScreen_noResults',
        desc: '[Screens][SearchScreen]',
      );

  String get btnClear => Intl.message(
        'Clear',
        name: '_SearchScreen_btnClear',
        desc: '[Screens][SearchScreen]',
      );

  String get searching => Intl.message(
        'Searching',
        name: '_SearchScreen_searching',
        desc: '[Screens][SearchScreen]',
      );
  String get unknownMediaType => Intl.message(
        'Unknown media type',
        name: '_SearchScreen_unknownMediaType',
        desc: '[Screens][SearchScreen]',
      );
}
