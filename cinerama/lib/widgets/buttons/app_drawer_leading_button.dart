import '../../material.dart';

class AppDrawerLeadingButton extends StatelessWidget {
  const AppDrawerLeadingButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      // tooltip: context.i18n.general.appDrawerLeadingButtonTooltip,
      onPressed: () {
        if (Scaffold.hasDrawer(context)) {
          Scaffold.of(context).openDrawer();
        }
      },
    );
  }
}
