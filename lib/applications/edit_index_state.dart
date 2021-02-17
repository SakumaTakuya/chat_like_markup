import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_index_state.freezed.dart';

@freezed
abstract class EditIndexState with _$EditIndexState {
  const factory EditIndexState({
    @Default(0) int value,
  }) = EditIndexStateData;
}

class EditIndexController extends StateNotifier<EditIndexState>
    with LocatorMixin {
  EditIndexController(int index) : super(EditIndexState(value: index));

  void seek(int index) {
    state = EditIndexState(value: index);
  }
}
