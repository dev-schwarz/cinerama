import 'package:flutter_modular/flutter_modular.dart';

import '../../../stores/login/tmdb_access_store.dart';
import 'tmdb_access_screen.dart';

class TmdbAccessModule extends ChildModule {
  static Inject get to => Inject<TmdbAccessModule>.of();

  @override
  List<Bind> get binds => [
        Bind((i) => TmdbAccessStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => const TmdbAccessScreen()),
      ];
}
