part of 'app_localizations.dart';

class _General {
  const _General();

  String get welcome => Intl.message(
        'Welcome',
        name: '_General_welcome',
        desc: '[General]',
      );

  String yes(bool firstLetterUCase) => Intl.select(
        firstLetterUCase,
        {
          true: 'Yes',
          false: 'yes',
        },
        name: '_General_yes',
        desc: '[General]',
        args: [firstLetterUCase],
      );

  String no(bool firstLetterUCase) => Intl.select(
        firstLetterUCase,
        {
          true: 'No',
          false: 'no',
        },
        name: '_General_no',
        desc: '[General]',
        args: [firstLetterUCase],
      );

  String yesNo(bool yes) => Intl.select(
        yes,
        {
          true: 'yes',
          false: 'no',
        },
        name: '_General_yesNo',
        desc: '[General]',
        args: [yes],
      );

  String get loading => Intl.message(
        'Loading',
        name: '_General_loading',
        desc: '[General]',
      );

  String get cancel => Intl.message(
        'Cancel',
        name: '_General_cancel',
        desc: '[General]',
      );

  String get clear => Intl.message(
        'Clear',
        name: '_General_clear',
        desc: '[General]',
      );

  String get appDrawerLeadingButtonTooltip => Intl.message(
        'Open navigation menu',
        name: '_General_appDrawerLeadingButtonTooltip',
        desc: '[General]',
      );
}
