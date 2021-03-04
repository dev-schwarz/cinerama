import '../../../material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i18n.screens.titles.about),
      ),
      body: Center(
        child: Text(
          context.i18n.screens.titles.about,
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}
