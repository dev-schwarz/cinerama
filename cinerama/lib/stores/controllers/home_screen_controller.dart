import 'package:mobx/mobx.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = _HomeScreenControllerBase with _$HomeScreenController;

abstract class _HomeScreenControllerBase with Store {
  @observable
  int pageIndex = 0;

  @action
  void changePage(int index) => pageIndex = index;
}
