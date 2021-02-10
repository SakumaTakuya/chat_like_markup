class Model {
  int key;
  Model copy() {
    throw 'Not Impletmented';
  }
}

class ModelSaver<M extends Model> {
  Future<void> save(M model) {
    throw 'Not Impletmented';
  }
}

typedef bool QueryFunction<M extends Model>(M model);

class ModelSearcher<M extends Model> {
  M search(int key) {
    throw 'Not Impletmented';
  }

  Iterable<M> searchAll({QueryFunction<M> query}) {
    throw 'Not Impletmented';
  }
}

class ModelDeleter<M extends Model> {
  void delete(int key) {
    throw 'Not Impletmented';
  }
}
