
import 'package:mobx/mobx.dart';
part 'counter_view_model.g.dart';

class CounterViewModel = _CounterViewModelBase with _$CounterViewModel;

abstract class _CounterViewModelBase with Store {
  @observable
  int value = 0;

  @action
  void increament() {
    value++;
  }

  @action
  void descreament() {
    value--;
  }

  @action
  void changeLAngua() {}
}
