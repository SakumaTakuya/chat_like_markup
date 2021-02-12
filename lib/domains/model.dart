abstract class Model {
  int key;
}

abstract class ModelSaver<M extends Model> {
  Future<void> save(M model);
}

typedef bool QueryFunction<M extends Model>(M model);

abstract class ModelSearcher<M extends Model> {
  M search(int key);

  Iterable<M> searchAll({QueryFunction<M> query});
}

abstract class ModelDeleter<M extends Model> {
  void delete(M model);
}

abstract class ModelCreater<M extends Model> {
  M create();
}
