part of 'app_localizations.dart';

class _MediaButtons {
  const _MediaButtons();

  String get favorite => Intl.message(
        'Favorite',
        name: '_MediaButtons_favorite',
        desc: '[MediaButtons]',
      );

  String favoriteTooltip(bool value) {
    return Intl.select(
      value,
      {
        true: 'Remove from favorites',
        false: 'Add to favorites',
      },
      name: '_MediaButtons_favoriteTooltip',
      desc: '[MediaButtons]',
      args: [value],
    );
  }

  String get watchList => Intl.message(
        'Watch List',
        name: '_MediaButtons_watchList',
        desc: '[MediaButtons]',
      );

  String watchListTooltip(bool value) {
    return Intl.select(
      value,
      {
        true: 'Remove from watch list',
        false: 'Add to watch list',
      },
      name: '_MediaButtons_watchListTooltip',
      desc: '[MediaButtons]',
      args: [value],
    );
  }

  String get rate => Intl.message(
        'Rate',
        name: '_MediaButtons_rate',
        desc: '[MediaButtons]',
      );

  String rateTooltip(bool value) {
    return Intl.select(
      value,
      {
        true: 'Edit or remove your rating',
        false: 'Rate',
      },
      name: '_MediaButtons_rateTooltip',
      desc: '[MediaButtons]',
      args: [value],
    );
  }

  String get playlist => Intl.message(
        'Add to playlist',
        name: '_MediaButtons_playlist',
        desc: '[MediaButtons]',
      );

  String get playlistTooltip => Intl.message(
        'Add to playlist',
        name: '_MediaButtons_playlistTooltip',
        desc: '[MediaButtons]',
      );
}
