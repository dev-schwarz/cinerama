import 'package:flutter_modular/flutter_modular.dart';

import '../../global/app_routes.dart';
import '../../material.dart';

class AppBarSearchButton extends StatelessWidget {
  const AppBarSearchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      tooltip: context.i18n.screens.search.title,
      onPressed: () {
        Modular.to.pushNamed(AppRoutes.search);
      },
    );
  }
}
