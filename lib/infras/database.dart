import 'package:hive/hive.dart' show Hive, Box;
import '../domains/model.dart'
    show Model, ModelDeleter, ModelSaver, ModelSearcher;

class DatabaseInHive<M extends Model>
    implements ModelDeleter<M>, ModelSaver<M>, ModelSearcher<M> {
  DatabaseInHive(this._name);
  Box<M> _box;
  final String _name;

  Future<void> open() async => _box = await Hive.openBox(this._name);

  @override
  void delete(int key) => _box.delete(key);

  @override
  Future<void> save(M model) async {
    if (model.key == null) {
      final key = await _box.add(model);
      model.key = key;
    }
    await _box.put(model.key, model);
  }

  @override
  M search(int key) => _box.get(key);

  @override
  Iterable<M> searchAll({query}) =>
      _box.isEmpty ? null : _box.values.where(query);
}
