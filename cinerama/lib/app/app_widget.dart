import 'package:flutter_modular/flutter_modular.dart';

import '../global/app_routes.dart';
import '../global/app_themes.dart';
import '../material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemesData.theme,
      darkTheme: AppThemesData.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.initial,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      builder: (_, child) => AppTheme(child),
    );
  }
}
