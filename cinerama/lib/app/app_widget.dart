import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../global/app_themes.dart';
import '../global/localizations/app_localizations.dart';
import '../global/navigation/app_navigation.dart';
import '../material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (ctx) => ctx.i18n.appTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        const Locale('en'),
        const Locale('pt'),
      ],
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
