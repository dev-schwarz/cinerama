import '../../../material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text(
          'About',
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}
