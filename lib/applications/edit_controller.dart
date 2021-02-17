import 'package:state_notifier/state_notifier.dart';

class EditIndexController extends StateNotifier<int> with LocatorMixin {
  EditIndexController(int index) : super(index);

  void seek(int index) {
    state = index;
  }

  int get current => state;
}
