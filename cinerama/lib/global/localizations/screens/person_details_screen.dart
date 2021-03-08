part of '../app_localizations.dart';

class _PersonDetailsScreen {
  const _PersonDetailsScreen();

  String get biography => Intl.message(
        'Biography',
        name: '_PersonDetailsScreen_biography',
        desc: '[Screens][PersonDetailsScreen]',
      );

  String get placeOfBirth => Intl.message(
        'Place of birth',
        name: '_PersonDetailsScreen_placeOfBirth',
        desc: '[Screens][PersonDetailsScreen]',
      );

  String get notAvailable => Intl.message(
        'Not available',
        name: '_PersonDetailsScreen_notAvailable',
        desc: '[Screens][PersonDetailsScreen]',
      );

  String get knownFor => Intl.message(
        'Known for',
        name: '_PersonDetailsScreen_knownFor',
        desc: '[Screens][PersonDetailsScreen]',
      );
}
