import 'package:hive/hive.dart' show Hive, Box;
import '../domains/model.dart'
    show Model, ModelCreater, ModelDeleter, ModelSaver, ModelSearcher;

abstract class DatabaseInHive<M extends Model>
    implements
        ModelDeleter<M>,
        ModelSaver<M>,
        ModelSearcher<M>,
        ModelCreater<M> {
  DatabaseInHive(this._name);
  Box<M> box;
  final String _name;

  Future<void> open() async => box = await Hive.openBox<M>(this._name);

  @override
  void delete(M model) {
    if (model != null) {
      box.delete(model.key);
    }
  }

  @override
  Future<void> save(M model) async {
    if (model.key == null) {
      final key = await box.add(model);
      model.key = key;
    } else {
      await box.put(model.key, model);
    }
  }

  @override
  M search(int key) => box.get(key);

  @override
  Iterable<M> searchAll({query}) {
    if (box.isEmpty) {
      return null;
    }

    if (query == null) {
      return box.values;
    }

    return box.values.where(query);
  }
}
