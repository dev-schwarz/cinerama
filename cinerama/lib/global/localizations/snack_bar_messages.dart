part of 'app_localizations.dart';

class _SnackBarMessages {
  const _SnackBarMessages();

  String favoriteChanged(bool value) => Intl.select(
        value,
        {
          true: 'Added to favorites',
          false: 'Removed from favorites',
        },
        name: '_SnackBarMessages_favoriteChanged',
        desc: '[SnackBarMessages]',
        args: [value],
      );

  String watchListChanged(bool value) => Intl.select(
        value,
        {
          true: 'Added to watch list',
          false: 'Removed from watch list',
        },
        name: '_SnackBarMessages_watchListChanged',
        desc: '[SnackBarMessages]',
        args: [value],
      );

  String rateChanged(bool value) => Intl.select(
        value,
        {
          true: 'Item rated',
          false: 'Item rating cleared',
        },
        name: '_SnackBarMessages_rateChanged',
        desc: '[SnackBarMessages]',
        args: [value],
      );

  String _listsChanged(bool added, int howMany) => Intl.select(
        added,
        {
          true: """${Intl.plural(
            howMany,
            zero: '',
            one: 'Added to 1 list. ',
            other: 'Added to $howMany lists. ',
          )}""",
          false: """${Intl.plural(
            howMany,
            zero: '',
            one: 'Removed from 1 list. ',
            other: 'Removed from $howMany lists. ',
          )}""",
        },
        name: '_SnackBarMessages__listsChanged',
        desc: '[SnackBarMessages]',
        args: [added, howMany],
      );

  String listsChanged(int listsAdded, int listsRemoved) => '${_listsChanged(true, listsAdded)}'
      '${_listsChanged(false, listsRemoved)}';
}
