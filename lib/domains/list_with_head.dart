import 'dart:math';

import 'package:flutter/cupertino.dart';

class ListWithHead<T> {
  ListWithHead(this.content, this._head);
  final List<T> content;

  @protected
  int _head;
}

extension ListWithHeadMethod<T> on ListWithHead<T> {
  int get head {
    _head = max(0, min(_head, content.length - 1));
    return _head;
  }

  T get current => content[head];
}

abstract class HeadOperator<T> {
  void seek(int head);
  void insert(T value);
  void rewrite(T value);
  void bring(int fromIndex);
  void seekNextOrNew({T newItem});
  void remove();
}
