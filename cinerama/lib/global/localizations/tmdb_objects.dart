part of 'app_localizations.dart';

class _TmdbObjects {
  const _TmdbObjects();

  String sortOrder(SortOrder order, [bool invert = false]) => Intl.select(
        order,
        {
          SortOrder.asc: """${Intl.select(
            invert,
            {
              true: 'descending',
              false: 'ascending',
            },
          )}""",
          SortOrder.desc: """${Intl.select(
            invert,
            {
              true: 'ascending',
              false: 'descending',
            },
          )}""",
        },
        name: '_TmdbObjects_sortOrder',
        desc: '[TmdbObjects]',
        args: [order, invert],
      );

  String _sortOrderSwitch(String orderText) => Intl.message(
        'Switch to "$orderText" order',
        name: '_TmdbObjects__sortOrderSwitch',
        desc: '[TmdbObjects]',
        args: [orderText],
      );

  String sortOrderSwitch(SortOrder order) => _sortOrderSwitch(sortOrder(order, true));
}
