class Model {
  int key;
  Model copy() {
    throw 'Not Impletmented';
  }
}

class ModelSaver<M extends Model> {
  void save(M model) {
    throw 'Not Impletmented';
  }
}

typedef bool QueryFunction(Model model);

class ModelSearcher<M extends Model> {
  M search(int key) {
    throw 'Not Impletmented';
  }

  Iterable<M> searchAll({QueryFunction query}) {
    throw 'Not Impletmented';
  }
}

class ModelDeleter<M extends Model> {
  void delete(int key) {
    throw 'Not Impletmented';
  }
}
