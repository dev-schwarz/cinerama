import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import 'initialize_i18n/messages_all.dart';

part 'general.dart';
part 'media_buttons.dart';
part 'screens.dart';
part 'tmdb_objects.dart';
part 'snack_bar_messages.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final localeName = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();

    final cannonicalizedLocaleName = Intl.canonicalizedLocale(localeName);

    return initializeMessages(cannonicalizedLocaleName).then((_) {
      Intl.defaultLocale = cannonicalizedLocaleName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  _General get general => const _General();

  _Screens get screens => const _Screens();

  _TmdbObjects get tmdb => const _TmdbObjects();

  _MediaButtons get mediaButtons => const _MediaButtons();

  _SnackBarMessages get snackBarMessages => const _SnackBarMessages();

  String get appTitle => Intl.message(
        'Cinerama',
        name: 'appTitle',
        desc: 'App main title',
      );
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return (const ['en', 'pt']).contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
