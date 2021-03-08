import 'package:cinerama/global/tmdb_helper_mixin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  group('mixin [TmdbHelperMixin] Test', () {
    test('method [formatCurrency]', () {
      final r = _TmdbHelperMixinTest().formatCurrency(10.789);
      prt(r, 'formatCurrency');
      expect(r, '\$10.79');
    });

    test('method [formatDate]', () {
      initializeDateFormatting(null, null).whenComplete(() {
        Intl.defaultLocale = 'pt_BR';
        final dt = DateTime(1978, 5, 6);
        final r = _TmdbHelperMixinTest().formatDate(dt);
        prt(r, 'formatDate');
        expect(r, '06/05/1978');
      });
    });

    test('formatDate tests', () {
      initializeDateFormatting(null, null).whenComplete(() {
        final dt = DateTime(1978, 5, 6);
        // const pt = 'MM/dd/yyyy';
        final pt = DateFormat.yMd('pt_BR').pattern;
        final r = DateFormat(pt).format(dt);
        prt(r);
      });
    });
  });
}

void prt(dynamic value, [String label]) {
  if (label?.trim()?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print('$label: $value');
  } else {
    // ignore: avoid_print
    print(value);
  }
}

class _TmdbHelperMixinTest with TmdbHelperMixin {}
